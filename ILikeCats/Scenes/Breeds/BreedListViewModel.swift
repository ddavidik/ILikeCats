//
//  BreedListViewModel.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

@MainActor final class BreedListViewModel: ObservableObject {
    
    enum State {
        case initial
        case loading
        case fetched(loadingMore: Bool)
        case failed
    }
    
    @Injected private var apiManager: ApiManaging
    
    @Published var breeds: [Breed] = []
    @Published var state: State = .initial
    
    
    func fetchMoreIfNeeded(for breed: Breed) async {
        guard breed == breeds.last else {
            return
        }
        state = .fetched(loadingMore: true)
        await fetch()
    }
    
    func load() async {
        state = .loading
        await fetch()
    }
    
    func fetch(limit: Int? = nil, page: Int? = nil) async {
        do {
            let endpoint = BreedEndpoint.getBreeds(limit: limit, page: page)
            
            let response: [Breed] = try await apiManager.request(endpoint: endpoint)
            
            breeds = response
            state = .fetched(loadingMore: false)
        } catch {
            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .info)
                state = .fetched(loadingMore: false)
                return
            }
            debugPrint(error)
            state = .failed
        }
    }
}
