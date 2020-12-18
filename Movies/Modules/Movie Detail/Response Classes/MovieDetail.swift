//
//  MovieDetail.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {
    let genres: [Genre]?
    let id: Int?
    let imdbID: String?
    let originalLanguage: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case genres, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case title, video
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
