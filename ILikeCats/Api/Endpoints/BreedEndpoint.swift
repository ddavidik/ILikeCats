//
//  BreedEndpoint.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

enum BreedEndpoint: Endpoint {
    
    case getBreeds(limit: Int?, page: Int?)
    
    var path: String {
        switch self {
        case .getBreeds:
            return "breeds"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getBreeds(let limit?, let page?):
            return ["limit": String(limit), "page": String(page)]
        case .getBreeds:
            return [:]
        }
        
    }
}
