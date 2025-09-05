//
//  MoviesDataSource.swift
//  Networking
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation

public protocol MoviesDataSource {
    func fetchMoviesList() async throws -> [Movie]
}
