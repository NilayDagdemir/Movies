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
        view?.closeSearchBar()
        if searchText != "" {
            view?.showProgressHUD()
            interactor?.searchMovies(with: searchText)
        }
    }

    func getFilteredMovies() -> [Movie] {
        return filteredMovies
    }

    func movieCardClicked(with movieItem: Movie) {
        router?.navigateToMovieDetailScreen(of: movieItem)
    }
}

extension SearchPresenter: ISearchInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func movieListFiltered(_ filteredList: [Movie]) {
        self.filteredMovies = filteredList
        view?.hideProgressHUD()
        view?.reloadTableView()
        if filteredMovies.isEmpty {
            view?.showErrorDialog(with: Constants.Error.noMovieFound)
        }
    }
}
