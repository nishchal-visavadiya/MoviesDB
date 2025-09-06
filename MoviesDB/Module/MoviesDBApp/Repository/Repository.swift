//
//  Repository.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import Networking

protocol MoviesRepository: Sendable {
    func fetchMoviesList() async throws -> [Movie]
}
