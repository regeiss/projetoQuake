//
//  Theme.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 21/06/22.
//

import Foundation


// Service 
import Foundation

enum QuakeServiceError: Error 
{
    case failed
    case failedToDecode
    case invalidServerResponse
}

protocol QuakeService 
{
    func fetchAllQuakes() async throws -> [Quake]
}

struct QuakeServiceImpl: QuakeService 
{
    
    func fetchAllQuakes() async throws -> [Quake] 
    {
        
        let url = "https://rickandmortyapi.com/api/Quake"
        let configuration = URLSessionConfiguration.ephemeral 
        let (data, response) = try await URLSession(configuration: configuration).shared.data(from: URL(string: url)!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw QuakeServiceError.invalidServerResponse
              }
        
        let decodedData = try JSONDecoder().decode(QuakeServiceResult.self, from: data)
        return decodedData.results
    }
}
