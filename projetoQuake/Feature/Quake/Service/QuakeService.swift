//
//  QuakeService.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 23/06/22.
//

import Foundation

enum QuakesServiceError: Error 
{
    case failed
    case failedToDecode
    case invalidServerResponse
}

protocol QuakesService
{
    func fetch() async throws -> [Quake]
}

final class QuakesServiceImpl: QuakesService
{
    func fetch() async throws -> [Quake]
        {
            let urlSession = URLSession.shared
            let url = URL(string: APIConstants.baseURL.appending("/posts")) // ajustar
            let (data, _) = try await urlSession.data(from: url!)
            return try JSONDecoder().decode([Quake].self, from: data)
        }
}
