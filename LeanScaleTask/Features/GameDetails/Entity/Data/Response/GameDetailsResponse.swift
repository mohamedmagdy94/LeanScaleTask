//
//  GameDetailsResponse.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import Foundation

// MARK: - GameDetailsResponse
struct GameDetailsResponse {
    let id: Int?
    let slug, name, nameOriginal, gameDetailsResponseDescription: String?
    let metacritic: Int?
    let metacriticPlatforms: [MetacriticPlatform]?
    let released: String?
    let tba: Bool?
    let updated: String?
    let background_image, backgroundImageAdditional: String?
    let website: String?
    let rating: Double?
    let ratingTop: Int?
    let ratings: [Rating]?
    let reactions: [String: Int]?
    let added: Int?
    let addedByStatus: AddedByStatus?
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int?
    let achievementsCount, parentAchievementsCount: Int?
    let reddit_url: String?
    let redditName, redditDescription, redditLogo: String?
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int?
    let ratingsCount, suggestionsCount: Int?
    let alternativeNames: [String]?
    let metacritic_url: String?
    let parentsCount, additionsCount, gameSeriesCount: Int?
    let reviewsCount: Int?
    let saturatedColor, dominantColor: String?
    let parentPlatforms: [ParentPlatform]?
    let platforms: [PlatformElement]?
    let stores: [Store]?
    let developers, genres, tags, publishers: [Developer]?
    let esrbRating: EsrbRating?
    let description_raw: String?
}



// MARK: - Developer
struct Developer {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let domain: String?
    let language: Language?
}

enum Language {
    case eng
}



// MARK: - MetacriticPlatform
struct MetacriticPlatform {
    let metascore: Int?
    let url: String?
    let platform: MetacriticPlatformPlatform?
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform {
    let platform: Int?
    let name, slug: String?
}

// MARK: - ParentPlatform
struct ParentPlatform {
    let platform: EsrbRating?
}

// MARK: - PlatformElement
struct PlatformElement {
    let platform: PlatformPlatform?
    let releasedAt: String?
    let requirements: Requirements?
}

// MARK: - PlatformPlatform
struct PlatformPlatform {
    let id: Int?
    let name, slug: String?
    let image, yearEnd: NSNull?
    let yearStart: Int?
    let gamesCount: Int?
    let imageBackground: String?
}

// MARK: - Requirements
struct Requirements {
    let minimum, recommended: String?
}

