//
//  Url.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

extension URL {
    static func makeShareUrl(for path: String) -> URL? {
        URL(string: "ilikecats://vse.fis.ilikecats.com/\(path)")
    }
    
    func valueOf(queryParameter: String) -> String? {
        guard let url = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        return url.queryItems?
            .first { $0.name == queryParameter }?
            .value
    }
}
