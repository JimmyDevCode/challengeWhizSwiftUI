//
//  Enums.swift
//  challengeWhiz
//
//  Created by Jimmy Ronaldo Macedo Pizango on 20/08/23.
//

import Foundation

// MARK: - ColorPrimary

/*public enum PrimaryColor: Int {
    case r = 219
    case g = 40
    case b = 27
    case opacity = 1.0
}
*/

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
