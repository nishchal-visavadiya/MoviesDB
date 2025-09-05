//
//  APIService.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 01/09/25.
//

import Foundation

protocol APIService {
    func call<T: Decodable>(endpoint: TMDBEndpoint, queryParams: Encodable?, body: Encodable?) async throws -> T
}
