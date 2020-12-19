//
//  PersonDetailInteractor.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class PersonDetailInteractor {

    // MARK: Properties
    weak var output: IPersonDetailInteractorToPresenter?
    var networkAPI: APIClient?
}

extension PersonDetailInteractor: IPersonDetailInteractor {
    func retrievePersonDetails(with personId: Int) {
        networkAPI?.getPersonDetails(with: personId, onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let personDetails = response.results {
                   self.output?.personDetailsRetrieved(personDetails)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}
