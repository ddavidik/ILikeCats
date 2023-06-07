//
//  HttpHeader.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import Foundation

enum HttpHeader {
    enum HeaderField: String {
        case contentType = "Content-Type"
        case xApiKey = "x-api-key"
    }

    enum ContentType: String {
        case json = "application/json"
        case text = "text/html;charset=utf-8"
    }
}
