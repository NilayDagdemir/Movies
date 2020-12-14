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
    case getMovieDetails
    case getActorDetails
    case searchMovies

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getPopularMovies, .getMovieDetails, .getActorDetails:
            return .get
        case .searchMovies:
            return .post
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .getPopularMovies:
            return "discover/movie"
        case .getMovieDetails:
            return "movie"
        case .getActorDetails:
            return "person"
        case .searchMovies:
            return "search/movie"
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        return Config.baseURL
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        return JSONEncoding()
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getPopularMovies:
            return ["api_key": Config.apiKey,
                    "sort_by": "popularity.desc"]
        default:
            return nil
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
