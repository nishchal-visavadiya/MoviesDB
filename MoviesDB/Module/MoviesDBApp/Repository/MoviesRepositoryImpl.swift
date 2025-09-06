//
//  MoviesRepositoryImpl.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import FactoryKit
import Networking

final class MoviesRepositoryImpl: MoviesRepository {
    
    @Injected(\.moviesDataSource) private var moviesDataSource: MoviesDataSource
    
    func fetchMoviesList() async throws -> [Networking.Movie] {
        try await moviesDataSource.fetchMoviesList()
    }
}
