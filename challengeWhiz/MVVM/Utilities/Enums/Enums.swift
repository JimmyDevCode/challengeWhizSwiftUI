//
//  Enums.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

// MARK: - APIError Enum
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case emptyResponse
}

// MARK: - NameImageDefault Enum
enum NameImageDefault: String{
    case presentation = "image-presentation"
    case placeholder = "image-placeholder"
    case empty = "image-empty"
}
