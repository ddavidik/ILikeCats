//
//  BreedDetailViewModel.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import Foundation

@MainActor final class BreedDetailViewModel: ObservableObject {
    
    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    @Injected private var apiManager: ApiManaging
    
    var id: String?
    @Published var state: State = .initial
    @Published var breed: Breed?
    @Published var images: [CatImage]?
    
    nonisolated init(id: String? = nil) {
        self.id = id
    }
    
    func fetch() async {
        do {
            if let id {
                let breedEndpoint = BreedDetailEndpoint.getBreed(id: id)
                let breedResponse: Breed = try await apiManager.request(endpoint: breedEndpoint)
                
                let imagesEndpoint = ImagesEndpoint.getImages(id: id)
                let imagesResponse: [CatImage] = try await apiManager.request(endpoint: imagesEndpoint)
                
                breed = breedResponse
                images = imagesResponse
                state = .fetched
            } else {
                Logger.log("ID was not supplied!", .info)
                state = .failed
            }
        } catch {
            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .info)
                state = .fetched
                return
            }
            debugPrint(error)
            state = .failed
        }
    }
    
}
