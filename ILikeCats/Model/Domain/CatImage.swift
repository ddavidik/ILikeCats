//
//  Image.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import Foundation

struct CatImage: Decodable {
    let id: String
    let width: Int
    let height: Int
    let url: URL

    init(id: String, width: Int, height: Int, url: URL) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
    }
}

// MARK: - Conformances
extension CatImage: Equatable {}

// MARK: - Mock
#if DEBUG
extension CatImage {
    static let mock: CatImage = .init(
    id: "hBXicehMA",
    width: 1600,
    height: 951,
    url: URL(string: "https://cdn2.thecatapi.com/images/hBXicehMA.jpg")!
    )
}
#endif
