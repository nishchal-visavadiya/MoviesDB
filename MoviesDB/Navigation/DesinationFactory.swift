//
//  DesinationFactory.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import SwiftUI

@MainActor
final class DesinationFactory {
    
    static let shared = DesinationFactory()
    
    @ViewBuilder
    func makeDesination(for type: Destination) -> some View {
        switch type {
        case .movieDetails:
            Text("Movie Details View")
        }
    }
}

extension View {
    
    func registerDesintations() -> some View {
        navigationDestination(
            for: Destination.self,
            destination: DesinationFactory.shared.makeDesination(for:)
        )
    }
}
