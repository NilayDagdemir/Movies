//
//  PersonDetail.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - PersonDetail
struct PersonDetail: Codable {
    let alsoKnownAs: [String]
    let biography, birthday: String
    let imdbID, knownForDepartment, name, placeOfBirth: String
    let popularity: Double
    let profilePath: String

    enum CodingKeys: String, CodingKey {
        case alsoKnownAs = "also_known_as"
        case biography, birthday
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
}
