//
//  Navigator.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import SwiftUI

@MainActor
final class Navigator: ObservableObject {
    
    @Published var appState: AppState = .launch
    @Published var path: [Destination] = []
    
    func push(_ destination: Destination) {
        path.append(destination)
    }
    
    func pop() {
        guard path.count > 1 else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
