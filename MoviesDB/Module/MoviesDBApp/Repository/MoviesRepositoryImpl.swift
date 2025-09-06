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
    
    private let moviesDataSource: MoviesDataSource = Container.shared.moviesDataSource()
    
    func fetchMoviesList() async throws -> [Networking.Movie] {
        try await moviesDataSource.fetchMoviesList()
    }
}
