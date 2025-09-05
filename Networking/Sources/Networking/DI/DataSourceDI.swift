//
//  DataSourceDI.swift
//  Networking
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import FactoryKit

public extension Container {
    
    var moviesDataSource: Factory<MoviesDataSource> {
        self { MoviesDataSourceImpl() }
    }
}
