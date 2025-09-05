//
//  TMDBEndpoint.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 01/09/25.
//

import Foundation

enum TMDBEndpoint {
    case popularMovies
    
    var fullEndpoint: String {
        return basURL + version + endPoint
    }
    
    var endPoint: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        }
    }
    
    var version: String {
        switch self {
        case .popularMovies:
            return "3/"
        }
    }
    
    var basURL: String {
        switch self {
        default:
            return "https://api.themoviedb.org/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }
    
    var headers: [String: String] {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "api_key": "YOUR_API_KEY_HERE"
        ]
        switch self {
        default:
            break
        }
        return headers
    }
}
