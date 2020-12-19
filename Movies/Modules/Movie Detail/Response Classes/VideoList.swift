//
//  VideoList.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - VideoList
// swiftlint:disable identifier_name
struct VideoList: Codable {
    let id: Int?
    let results: [Video]?
}

// MARK: - Video
struct Video: Codable {
    let id, key: String?
    let name, site: String?

    enum CodingKeys: String, CodingKey {
        case id
        case key, name, site
    }
}
