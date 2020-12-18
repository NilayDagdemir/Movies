//
//  Constants.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class Constants {
    struct Error {
        static let defaultErrorMessage: String = "An error occured. Please try again later."
    }

    // MARK: Common
    enum PosterProperties: String {
        case low, high

        var resolution: String {
            switch self {
            case .low: return "w300"
            case .high: return "w780"
            }
        }
    }

    // MARK: Main
    struct Main {
        // MARK: Navigation Bar
        static let navBarTitle: String = "Movies"

        // MARK: SearchBar
        static let searchBarPlaceholder: String = "Enter a movie, person, or genre name."

        // MARK: Movie Not Found Popup
        static let movieNotFoundPopupMessage: String = "Movie not found."
    }
}

