//
//  BreedDetailEndpoint.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 09.06.2023.
//

import Foundation

enum BreedDetailEndpoint: Endpoint {
    
    case getBreed(id: String)
    
    var path: String {
        switch self {
        case let .getBreed(id):
            return "breeds/\(id)"
        }
    }
}
