//
//  MainContract.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol IMainView: IBaseView {
    func reloadTableView()
}

protocol IMainPresenter: IBasePresenter {
    func getMovieList() -> [Movie]
    func movieCardClicked(with movieItem: Movie)
}

protocol IMainInteractor: class {
    func retrieveMovieList()
}

protocol IMainInteractorToPresenter: IBaseInteractorToPresenter {
    func movieListRecieved(_ movieList: [Movie])
}

protocol IMainRouter: class {
    func navigateToMovieDetailScreen(of movieItem: Movie)
}
