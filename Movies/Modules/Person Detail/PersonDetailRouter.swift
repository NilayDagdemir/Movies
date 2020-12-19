//
//  PersonDetailRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class PersonDetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(with personId: Int) -> PersonDetailViewController {
        let viewController = PersonDetailViewController()
        let presenter = PersonDetailPresenter()
        let router = PersonDetailRouter()
        let interactor = PersonDetailInteractor()
        let networkAPI = APIClient()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.setSelectedPersonId(with: personId)

        router.view = viewController

        interactor.output = presenter
        interactor.networkAPI = networkAPI

        return viewController
    }
}

extension PersonDetailRouter: IPersonDetailRouter {
    // TODO: Implement wireframe methods
}
