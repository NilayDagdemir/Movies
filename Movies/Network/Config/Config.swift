//
//  Config.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

struct Config {
    static let apiKey: String = "75da63446392532806d68cbf9cf68d77"
    static let baseURL: String = "https://api.themoviedb.org/3/"
    static let basePosterURL: String = "http://image.tmdb.org/t/p"
    static func getPosterURL(with url: String) -> String {
        return "\(basePosterURL)/w780\(url)"
    }
}
