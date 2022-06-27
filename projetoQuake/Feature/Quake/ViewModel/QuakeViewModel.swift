//
//  QuakeViewModel.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 23/06/22.
//

import Foundation

protocol QuakesViewModel: ObservableObject
{
    func getAllQuakes() async
}

@MainActor
final class QuakesViewModelImpl: QuakesViewModel
{
    enum State 
    {
        case na
        case loading
        case success(data: [Quake])
        case failed(error: Error)
    }

    @Published private(set) var quakes: [Quake] = []
    
    private let service: QuakesService

    init(service: QuakesService)
    {
        self.service = service
    }
    
    func getAllQuakes() async
    {
        do
        {
            self.quakes = try await service.fetch()
        }
        catch
        {
            print(error)
        }
    }
}
