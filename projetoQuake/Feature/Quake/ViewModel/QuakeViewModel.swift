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

    @Published private(set) var Quakes: [Quake] = []
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    
    private let service: QuakesService

    init(service: QuakesService)
    {
        self.service = service
    }
    
    func getAllQuakes() async
    {
        self.state = .loading
        self.hasError = false
        do
        {
            let data = try await service.fetch()
            self.state = .success(data: data)
        }
        catch
        {
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
