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
}

protocol ISearchPresenter: IBasePresenter {
    func filterItems(with searchText: String)
    func getFilteredMovies() -> [Movie]
}

protocol ISearchInteractor: class {
    // TODO: Declare use case methods
}

protocol ISearchInteractorToPresenter: class {
    // TODO: Declare interactor output methods
}

protocol ISearchRouter: class {
    // TODO: Declare wireframe methods
}
