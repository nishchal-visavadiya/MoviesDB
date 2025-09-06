//
//  MoviesDBAppDI.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import FactoryKit

extension Container {
    
    var moviesRepository: Factory<MoviesRepository> {
        self { MoviesRepositoryImpl() }
    }
}
