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

    func getPopularMovies(onSuccess: @escaping OnSuccess<MovieList>, onError: OnError)
    func searchMovies(with searchQuery: String, onSuccess: @escaping OnSuccess<MovieList>, onError: OnError)
    func getMovieDetails(with movieId: Int, onSuccess: @escaping OnSuccess<MovieDetail>, onError: OnError)
    func getCast(with movieId: Int, onSuccess: @escaping OnSuccess<CastDetail>, onError: OnError)
    func getPersonDetails(with personId: Int, onSuccess: @escaping OnSuccess<PersonDetail>, onError: OnError)
    func getVideos(with movieId: Int, onSuccess: @escaping OnSuccess<VideoList>, onError: OnError)
}


class APIClient: APIClientInterface {
    func getPopularMovies(onSuccess: @escaping OnSuccess<MovieList>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getPopularMovies,
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func searchMovies(with searchQuery: String, onSuccess: @escaping OnSuccess<MovieList>, onError: OnError) {
        APIProvider.shared.performRequest(route: .searchMovies(searchQuery),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getMovieDetails(with movieId: Int, onSuccess: @escaping OnSuccess<MovieDetail>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getMovieDetails(movieId),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getCast(with movieId: Int, onSuccess: @escaping OnSuccess<CastDetail>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getCast(movieId),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getPersonDetails(with personId: Int, onSuccess: @escaping OnSuccess<PersonDetail>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getPersonDetails(personId),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getVideos(with movieId: Int, onSuccess: @escaping OnSuccess<VideoList>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getVideos(movieId),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }
}
