//
//  CastResponse.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: CastResponse
struct CastDetail: Codable {
    let cast: [Cast]?
}

// MARK: - Cast
struct Cast: Codable {
    let id: Int?
    let gender: Int?
    let knownForDepartment: Department?
    let name: String?
    let profilePath: String?
    let character: String?

    enum CodingKeys: String, CodingKey {
        case id, gender
        case knownForDepartment = "known_for_department"
        case name
        case profilePath = "profile_path"
        case character
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
