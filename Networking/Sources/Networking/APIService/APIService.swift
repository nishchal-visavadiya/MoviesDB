//
//  APIService.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 01/09/25.
//

import Foundation

protocol APIService: Sendable {
    func call<T: Decodable>(endpoint: TMDBEndpoint) async throws -> T
    func call<T: Decodable>(endpoint: TMDBEndpoint, body: Encodable) async throws -> T
    func call<T: Decodable>(endpoint: TMDBEndpoint, queryParams: Encodable) async throws -> T
    func call<T: Decodable>(endpoint: TMDBEndpoint, queryParams: Encodable, body: Encodable) async throws -> T
}
