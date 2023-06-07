//
//  ApiManager.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

protocol ApiManaging {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

class ApiManager: ApiManaging {

    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        
        return URLSession(configuration: config)
    }()
    
    func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
        
        let request = try endpoint.asURLRequest()
        
        let (data, response) = try await session.data(for: request)
        
        let httpResponse = response as? HTTPURLResponse
        
        debugPrint("Finished request: \(response)")
                
        guard let status =  httpResponse?.statusCode, (200...299).contains(status) else {
            throw APIError.unaceptableStatusCode
        }
        
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(T.self, from: data)

            return result
        } catch {
            throw APIError.decodingFailed(error: error)
        }
    }
}
