//
//  SearchContract.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol ISearchView: IBaseView {
    func reloadTableView()
    func closeSearchBar()
}

protocol ISearchPresenter: IBasePresenter {
    func filterItems(with searchText: String)
    func getFilteredMovies() -> [Movie]
}

protocol ISearchInteractor: class {
    func searchMovies(with searchText: String)
}

protocol ISearchInteractorToPresenter: IBaseInteractorToPresenter {
    func movieListFiltered(_ filteredList: [Movie])
}

protocol ISearchRouter: class {
    // TODO: Declare wireframe methods
}
