//
//  SearchPresenter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class SearchPresenter {

    // MARK: Properties

    weak var view: ISearchView?
    var router: ISearchRouter?
    var interactor: ISearchInteractor?

    private var filteredMovies = [Movie]()
}

extension SearchPresenter: ISearchPresenter {
    func viewDidLoad() {}
    
    func filterItems(with searchText: String) {
        if searchText != "" {
            // do the filtering
//            filteredMovies = filtrelenenElemanlar
            print("here search text is: \(searchText)")
        } else {
            view?.showErrorDialog(with: "Please enter a movie, genre, or person name.")
        }
    }

    func getFilteredMovies() -> [Movie] {
        return filteredMovies
    }
}

extension SearchPresenter: ISearchInteractorToPresenter {
    // TODO: implement interactor output methods
}
