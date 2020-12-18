//
//  APIRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Alamofire
import Foundation

// MARK: GUIDELINE
// Yeni bir servis yada api eklemek için
// 1- case olarak api'ye bir isim ver ve apinin kullanacağı parametreleri tanımla
// 2- case'in HTTPMethod tipindeki metodunu belirle
// 3- api baseURL'e ek olarak herhangi bir path ve query field içeriyorsa path'e ekle
// 4- api veya servisin hangi baseURL'i kullanacağını belirle "baseURL"
// 5- api veya servisin request tipi json yada soap oldunu belirtmek için encoder kısmına ekle
// 6- api veya servis HTTPBody de bir parametre göndericekse Paramaters larını belirle

enum APIRouter: URLRequestConvertible {

    case getPopularMovies
    case searchMovies(_ searchQuery: String)
    case getMovieDetails(_ movieId: Int)
    case getCast(_ movieId: Int)
    case getPersonDetails(_ personId: Int)
    case getVideos(_ movieId: Int)

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getPopularMovies, .searchMovies, .getMovieDetails, .getCast, .getPersonDetails, .getVideos:
            return .get
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .getPopularMovies:
            return "discover/movie"
        case .searchMovies:
            return "search/movie"
        case .getMovieDetails(let movieId):
            return "movie/\(movieId)"
        case .getCast(let movieId):
            return "movie/\(movieId)/credits"
        case .getPersonDetails(let personId):
            return "person/\(personId)"
        case .getVideos(let movieId):
            return "movie/\(movieId)/videos"
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        return Config.baseURL
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        return URLEncoding()
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
            // api key parametrelerini tekilleştir.
        case .getPopularMovies:
            return ["api_key": Config.apiKey,
                    "sort_by": "popularity.desc"]
        case .searchMovies(let searchQuery):
            return ["api_key": Config.apiKey,
                    "query": searchQuery]
        case .getMovieDetails, .getCast, .getPersonDetails, .getVideos:
            return ["api_key": Config.apiKey]
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        let jsonHeader = "application/json"
        urlRequest.setValue(jsonHeader, forHTTPHeaderField: "Accept")
        urlRequest.setValue(jsonHeader, forHTTPHeaderField: "Content-Type")

        // Parameters
        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        return urlRequest
    }

}
