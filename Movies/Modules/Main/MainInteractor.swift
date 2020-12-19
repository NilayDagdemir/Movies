//
//  MainInteractor.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class MainInteractor {

    // MARK: Properties
    weak var output: IMainInteractorToPresenter?
    var networkAPI: APIClientInterface?
}

extension MainInteractor: IMainInteractor {
    func retrieveMovieList() {
        networkAPI?.getPopularMovies(onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let movieList = response.results?.results {
                self.output?.movieListRecieved(movieList)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}
