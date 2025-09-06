//
//  AppViewModel.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import FactoryKit
import Networking

final class AppViewModel: ObservableObject, @unchecked Sendable {
    
    @Injected(\.moviesRepository) private var moviesDataSource: MoviesRepository
}
