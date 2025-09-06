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
        []
    }
}
