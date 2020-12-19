//
//  MovieList.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - MovieList
struct MovieList: Codable {
    let results: [Movie]?
}

// MARK: - Movie
// swiftlint:disable identifier_name
struct Movie: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let language: String?
    let posterPath: String?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let genreIDS: [Int]?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity, video
        case language = "original_language"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
