//
//  ImagesEndpoint.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 09.06.2023.
//

import Foundation

enum ImagesEndpoint: Endpoint {
    
    case getImages(id: String? = nil)
    
    var path: String {
        switch self {
        case .getImages:
            return "images/search"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getImages(let id?):
            return ["breed_ids": id, "limit": "5"]
            
        case .getImages:
            return [:]
        }
    }
}
