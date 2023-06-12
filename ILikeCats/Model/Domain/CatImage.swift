//
//  Image.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import Foundation
import SwiftUI

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
extension CatImage: Identifiable {}

// MARK: - Function to return default image
extension CatImage {
    static func getDefaultImage() -> some View {
        Image(uiImage: UIImage(named: "Sad cat ok")!)
            .resizable()
            .frame(width: 110, height: 110)
            .cornerRadius(8)
    }
}

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
