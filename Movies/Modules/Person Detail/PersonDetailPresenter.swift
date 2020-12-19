//
//  PersonDetailPresenter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class PersonDetailPresenter {

    // MARK: Properties
    weak var view: IPersonDetailView?
    var router: IPersonDetailRouter?
    var interactor: IPersonDetailInteractor?

    private var personId: Int?
    private var personDetail: PersonDetail?
}

extension PersonDetailPresenter: IPersonDetailPresenter {
    func viewDidLoad() {
        view?.showProgressHUD()
        if let personId = personId {
            interactor?.retrievePersonDetails(with: personId)
        }
    }

    func setSelectedPersonId(with personId: Int) {
        self.personId = personId
    }

    func getPersonDetail() -> PersonDetail? {
        return personDetail ?? nil
    }
}

extension PersonDetailPresenter: IPersonDetailInteractorToPresenter {
    func wsErrorOccurred(with message: String) {
        view?.hideProgressHUD()
        view?.showErrorDialog(with: message)
    }

    func personDetailsRetrieved(_ personDetail: PersonDetail) {
        self.personDetail = personDetail
        view?.hideProgressHUD()
        view?.setupPersonDetailView(with: personDetail)
    }
}
