//
//  MoviesDataSourceImpl.swift
//  Networking
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import FactoryKit

final class MoviesDataSourceImpl: MoviesDataSource {
    
    private let apiService: APIService = Container.shared.apiService()
    
    func fetchMoviesList() async throws -> [Movie] {
        let response: PopularMoviesResponse = try await apiService.call(endpoint: .popularMovies)
        return response.results.map { $0.toMovie() }
    }
}
