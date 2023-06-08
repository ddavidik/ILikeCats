//
//  Breed.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import Foundation

struct Breed: Decodable {
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case origin
            case country_code
            case description
            case life_span
            case weight
            case child_friendly
            case dog_friendly
            case grooming
            case image
//            case imageUrls = "images"
            case wikiUrl = "wiki"
        }

        let id: String
        let name: String
        let origin: String
        let country_code: String
        let description: String
        let life_span: String
        let weight: Weight
        let child_friendly: Int
        let dog_friendly: Int
        let grooming: Int
        let image: CatImage?
//        let imageUrls: [URL]
        let wikiUrl: URL?
    }

// MARK: - Conformances
extension Breed: Identifiable {}
extension Breed: Equatable {}

// MARK: - Mock
#if DEBUG
extension Breed {
    static let mock: Breed = .init(
        id: "abob",
        name: "American Bobtail",
        origin: "United States",
        country_code: "US",
        description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
        life_span: "11 - 15",
        weight: .mock,
        child_friendly: 4,
        dog_friendly: 5,
        grooming: 1,
        image: .mock,
        wikiUrl: URL(string: "https://en.wikipedia.org/wiki/American_Bobtail")!
    )
    
    static let breeds: [Breed] = {
        (0 ... 20).map {
            Breed(
                id: "abob",
                name: "American Bobtail - \($0)",
                origin: "United States",
                country_code: "US",
                description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
                life_span: "11 - 15",
                weight: .mock,
                child_friendly: 4,
                dog_friendly: 5,
                grooming: 1,
                image: .mock,
                wikiUrl: URL(string: "https://en.wikipedia.org/wiki/American_Bobtail")!
            )
        }
    }()
}
#endif
