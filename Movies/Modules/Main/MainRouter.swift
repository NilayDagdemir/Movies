//
//  MainRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class MainRouter {

    // MARK: Properties
    weak var view: UIViewController?

    // MARK: Static methods
    static func setupModule() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor()
        let networkAPI = APIClient()
        let adapter = MainTableViewAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter
        interactor.networkAPI = networkAPI

        return viewController
    }
}

extension MainRouter: IMainRouter {
    func navigateToMovieDetailScreen(of movieItem: Movie) {
        if let movieId = movieItem.id {
            let movieDetailVC = MovieDetailRouter.setupModule(with: movieId)
            view?.navigationController?.pushViewController(movieDetailVC, animated: true)
        } else {
            view?.showErrorDialog(with: Constants.Error.defaultErrorMessage)
        }
    }
}
