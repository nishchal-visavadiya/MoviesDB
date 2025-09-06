//
//  Movie.swift
//  Networking
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation

public struct Movie: Sendable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
