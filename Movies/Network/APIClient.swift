//
//  APIClient.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Alamofire
import Foundation

protocol APIClientInterface {

    typealias OnSuccess<T: Decodable> = ((WSResponse<T>) -> Void)
    typealias OnError = ((WSError?) -> Void)?

    func getPopularMovies(onSuccess: @escaping OnSuccess<TMDBListMovieResponse>, onError: OnError)
    func searchMovies(with searchQuery: String, onSuccess: @escaping OnSuccess<TMDBListMovieResponse>, onError: OnError)
}


class APIClient: APIClientInterface {
    func getPopularMovies(onSuccess: @escaping OnSuccess<TMDBListMovieResponse>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getPopularMovies,
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func searchMovies(with searchQuery: String, onSuccess: @escaping OnSuccess<TMDBListMovieResponse>, onError: OnError) {
        APIProvider.shared.performRequest(route: .searchMovies(searchQuery),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }
}
