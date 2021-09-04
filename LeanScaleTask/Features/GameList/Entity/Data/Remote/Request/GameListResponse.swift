// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameListResponse = try? newJSONDecoder().decode(GameListResponse.self, from: jsonData)

import Foundation

// MARK: - GameListResponse
struct GameListResponse : Codable {
    let count: Int?
    let next: String?
    let results: [Result]?
    let userPlatforms: Bool?
}

// MARK: - Result
struct Result : Codable {
    let slug, name: String?
    let playtime: Int?
    let platforms: [Platform]?
    let stores: [Store]?
    let released: String?
    let tba: Bool?
    let backgroundImage: String?
    let rating: Double?
    let ratingTop: Int?
    let ratings: [Rating]?
    let ratingsCount, reviewsTextCount, added: Int?
    let addedByStatus: AddedByStatus?
    let metacritic: Int?
    let suggestionsCount: Int?
    let updated: String?
    let id: Int?
    let score: String?
    let tags: [Tag]?
    let esrbRating: EsrbRating?
    let reviewsCount: Int?
    let saturatedColor, dominantColor: String?
    let shortScreenshots: [ShortScreenshot]?
    let parentPlatforms: [Platform]?
    let genres: [Genre]?
    let communityRating: Int?
}

// MARK: - AddedByStatus
struct AddedByStatus : Codable {
    let yet, owned, beaten, toplay: Int?
    let dropped, playing: Int?
}

// MARK: - EsrbRating
struct EsrbRating : Codable {
    let id: Int?
    let name, slug, nameEn, nameRu: String?
}

// MARK: - Genre
struct Genre : Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - Platform
struct Platform : Codable {
    let platform: Genre?
}

// MARK: - Rating
struct Rating : Codable {
    let id: Int?
    let title: String?
    let count: Int?
    let percent: Double?
}

// MARK: - ShortScreenshot
struct ShortScreenshot : Codable {
    let id: Int?
    let image: String?
}

// MARK: - Store
struct Store : Codable {
    let store: Genre?
}

// MARK: - Tag
struct Tag : Codable {
    let id: Int?
    let name, slug: String?
    let language: String?
    let gamesCount: Int?
    let imageBackground: String?
}

