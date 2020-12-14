//
//  WSResponse.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - TMDBWebServiceResponse
struct WSResponse<T: Decodable> {
    let results: T?
    let error: WSError?

    init(_ results: T? = nil, _ error: WSError? = nil) {
        self.results = results
        self.error = error
    }
}

// MARK: - TMDBWebServiceError
struct WSError: Codable {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
