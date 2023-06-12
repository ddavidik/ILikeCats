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
            case countryCode = "country_code"
            case description
            case lifeSpan = "life_span"
            case weight
            case temperament
            case image
            case wikiUrl = "wikipedia_url"
        }

        let id: String
        let name: String
        let origin: String
        let countryCode: String
        let description: String
        let lifeSpan: String
        let weight: Weight
        let temperament: String
        let image: CatImage?
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
        countryCode: "US",
        description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
        lifeSpan: "11 - 15",
        weight: .mock,
        temperament: "Intelligent, Interactive, Lively, Playful, Sensitive",
        image: .mock,
        wikiUrl: URL(string: "https://en.wikipedia.org/wiki/American_Bobtail")!
    )
    
    static let breeds: [Breed] = {
        (0 ... 20).map {
            Breed(
                id: "abob",
                name: "American Bobtail - \($0)",
                origin: "United States",
                countryCode: "US",
                description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
                lifeSpan: "11 - 15",
                weight: .mock,
                temperament: "Intelligent, Interactive, Lively, Playful, Sensitive",
                image: .mock,
                wikiUrl: URL(string: "https://en.wikipedia.org/wiki/American_Bobtail")!
            )
        }
    }()
}
#endif
