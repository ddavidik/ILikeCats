//
//  ApiError.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

enum ApiError: Error {
    case unaceptableStatusCode
    case decodingFailed(error: Error)
    case invalidUrlComponents
}
