//
//  Endpoint.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String] { get }
    var urlParameters: [String: String] { get }
    
    func asURLRequest() throws -> URLRequest
}

extension Endpoint {
    var method: HttpMethod {
        .get
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var urlParameters: [String: String] {
        [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = Constants.baseAPIUrl.appendingPathComponent(path)

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw ApiError.invalidUrlComponents
        }

        if !urlParameters.isEmpty {
            urlComponents.queryItems = urlParameters.map { URLQueryItem(name: $0, value: String(describing: $1)) }
        }

        guard let url = urlComponents.url else {
            throw ApiError.invalidUrlComponents
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        request.setValue(
            Constants.apiKey,
            forHTTPHeaderField: HttpHeader.HeaderField.xApiKey.rawValue
        )

        request.setValue(
            HttpHeader.ContentType.json.rawValue,
            forHTTPHeaderField: HttpHeader.HeaderField.contentType.rawValue
        )

        return request
    }
}
