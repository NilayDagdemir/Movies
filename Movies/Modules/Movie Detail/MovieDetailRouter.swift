//
//  MovieDetailRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailRouter {

    // MARK: Properties
    weak var view: UIViewController?

    // MARK: Static methods
    static func setupModule(with movieId: Int) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let presenter = MovieDetailPresenter()
        let router = MovieDetailRouter()
        let interactor = MovieDetailInteractor()
        let networkAPI = APIClient()
        let adapter = MovieDetailCollectionViewAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.setSelectedMovieId(with: movieId)

        router.view = viewController

        interactor.output = presenter
        interactor.networkAPI = networkAPI

        return viewController
    }
}

extension MovieDetailRouter: IMovieDetailRouter {
    func navigateToPersonDetailScreen(of personId: Int) {
        let vc = PersonDetailRouter.setupModule(with: personId)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
