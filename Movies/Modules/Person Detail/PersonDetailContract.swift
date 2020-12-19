//
//  PersonDetailContract.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

protocol IPersonDetailView: IBaseView {
    func setupPersonDetailView(with personDetailItem: PersonDetail)
}

protocol IPersonDetailPresenter: IBasePresenter {
    func setSelectedPersonId(with: Int)
    func getPersonDetail() -> PersonDetail?
}

protocol IPersonDetailInteractor: class {
    func retrievePersonDetails(with personId: Int)
}

protocol IPersonDetailInteractorToPresenter: IBaseInteractorToPresenter {
    func personDetailsRetrieved(_ personDetail: PersonDetail)
}
