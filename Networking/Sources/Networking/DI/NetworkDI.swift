//
//  NetworkDI.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 01/09/25.
//

import Foundation
import FactoryKit

extension Container {
    
    var apiService: Factory<APIService> {
        self { APIServiceImpl() }
    }
}

