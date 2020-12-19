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
    let biography, birthday: String
    let knownForDepartment, name, placeOfBirth: String
    let profilePath: String

    enum CodingKeys: String, CodingKey {
        case biography, birthday
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
