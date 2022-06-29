//
//  QuakeService.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 23/06/22.
//
import Foundation
import OSLog

enum QuakesServiceError: Error 
{
    case failed
    case failedToDecode
    case invalidServerResponse
}

protocol QuakesService
{
    func fetchQuakes() async throws //-> [Quake]
}

final class QuakesServiceImpl: QuakesService
{
    let logger = Logger(subsystem: "*", category: "persistence")
    
//    func fetch() async throws -> [Quake]
//    {
//        let urlSession = URLSession.shared
//        let url = URL(string: APIConstants.baseUrl.appending("query?format=geojson&starttime=2014-01-01&endtime=2014-01-02")) // ajustar
//        print(url!)
//        let (data, _) = try await urlSession.data(from: url!)
//        return try JSONDecoder().decode([Quake].self, from: data)
//    }

   /// Fetches the earthquake feed from the remote server, and imports it into Core Data.
    func fetchQuakes() async throws
    {
        let url = URL(string: APIConstants.baseUrl.appending("query?format=geojson&starttime=2014-01-01&endtime=2014-01-02"))! // ajustar
        let session = URLSession.shared
        guard let (data, response) = try? await session.data(from: url),
              let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            logger.debug("Failed to received valid response and/or data.")
            throw QuakeError.missingData
        }

        do
        {
            // Decode the GeoJSON into a data model.
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .secondsSince1970
            let geoJSON = try jsonDecoder.decode(GeoJSON.self, from: data)
            let quakePropertiesList = geoJSON.quakePropertiesList
            logger.debug("Received \(quakePropertiesList.count) records.")

            // Import the GeoJSON into Core Data.
            logger.debug("Start importing data to the store...")
            try await importQuakes(from: quakePropertiesList)
            logger.debug("Finished importing data.")
        }
        catch
        {
            throw QuakeError.wrongDataFormat(error: error)
        }
    }
}
