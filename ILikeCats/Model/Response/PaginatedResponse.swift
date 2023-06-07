//
//  PaginatedResponse.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

struct PaginatedResponse<T: Decodable> {
    let info: PaginationInfo
    let results: [T]
}

extension PaginatedResponse: Decodable {}
