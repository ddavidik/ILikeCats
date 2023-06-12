//
//  CatImageViewModel.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 12.06.2023.
//

import Foundation

@MainActor final class CatImageViewModel: ObservableObject {
    
    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    @Injected private var apiManager: ApiManaging
    
    var id: String?
    @Published var state: State = .initial
    @Published var images: [CatImage]?
    
    nonisolated init(id: String? = nil) {
        self.id = id
    }
    
    func fetch() async {
        do {
            let imagesEndpoint = ImagesEndpoint.getImages()
            let imagesResponse: [CatImage] = try await apiManager.request(endpoint: imagesEndpoint)
            
            images = imagesResponse
            state = .fetched
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
