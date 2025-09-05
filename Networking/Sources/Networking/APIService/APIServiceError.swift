//
//  APIServiceError.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation

public enum APIServiceError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case queryParameterEncodingFailed
    case requestBodyEncodingFailed
}
