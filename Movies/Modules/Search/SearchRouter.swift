//
//  SearchRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> SearchViewController {
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let adapter = SearchTableViewAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension SearchRouter: ISearchRouter {
    // TODO: Implement wireframe methods
}
