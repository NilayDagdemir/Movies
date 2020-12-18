//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

class MovieDetailInteractor {

    // MARK: Properties
    weak var output: IMovieDetailInteractorToPresenter?
    var networkAPI: APIClient?
}

extension MovieDetailInteractor: IMovieDetailInteractor {
    func retrieveMovieDetails(with movieId: Int) {
        networkAPI?.getMovieDetails(with: movieId, onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let movieDetails = response.results {
                   self.output?.movieDetailsRecieved(movieDetails)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }

    func retrieveVideos(with movieId: Int) {
        networkAPI?.getVideos(with: movieId, onSuccess: { [weak self] response in
            print("here video retrieved : \(response)")
            guard let self = self else { return }
            // buradaki 2 results'ı düzelt.
            if let videos = response.results?.results {
                   self.output?.videosRecieved(videos)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }

    func retrieveCast(with movieId: Int) {
        networkAPI?.getCast(with: movieId, onSuccess: { [weak self] response in
            print("here cast retrieved : \(response)")
            guard let self = self else { return }
            if let cast = response.results?.cast {
                   self.output?.castRecieved(cast)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
            }, onError: { error in
                self.output?.wsErrorOccurred(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}
