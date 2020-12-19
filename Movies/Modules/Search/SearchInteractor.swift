//
//  SearchInteractor.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class SearchInteractor {

    // MARK: Properties
    weak var output: ISearchInteractorToPresenter?
    var networkAPI: APIClientInterface?
}

extension SearchInteractor: ISearchInteractor {
    func searchMovies(with searchText: String) {
        networkAPI?.searchMovies(with: searchText, onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let filteredList = response.results?.results {
                self.output?.movieListFiltered(filteredList)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}
