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
        static let noOverviewTextExists: String = "**No overview exists for this one**"
        static let noSearchTextEntered: String = "Please enter a movie, genre, or person name."
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
        static let navBarTitle: String = "Popular Movies"

        // MARK: Movie Not Found Popup
        static let movieNotFoundPopupMessage: String = "Movie not found."

        // MARK: Main Table View
        static let mainTableViewRowHeight: CGFloat = 220
    }

    // MARK: Main
    struct Search {
        // MARK: Navigation Bar
        static let navBarTitle: String = "Search Movies"

        // MARK: SearchBar
        static let searchBarPlaceholder: String = "Enter a movie, person, or genre name."
    }

    // MARK: Movie Detail Collection View Cells
    enum MovieDetailSectionHeaderCells: String {
        case video, cast

        var title: String {
            switch self {
            case .video: return "Videos:"
            case .cast: return "Cast:"
            }
        }
    }
}
