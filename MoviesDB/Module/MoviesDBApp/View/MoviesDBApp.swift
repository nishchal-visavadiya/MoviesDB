//
//  MoviesDBApp.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import SwiftUI

struct MoviesDBApp: View {
    
    @StateObject private var navigator: Navigator
    @StateObject private var appViewModel: AppViewModel
    @StateObject private var sceneViewModel: SceneViewModel
    
    init(
        navigator: Navigator,
        sceneViewModel: SceneViewModel,
        appViewModel: AppViewModel
    ) {
        _navigator = StateObject(wrappedValue: navigator)
        _appViewModel = StateObject(wrappedValue: appViewModel)
        _sceneViewModel = StateObject(wrappedValue: sceneViewModel)
    }
    
    var body: some View {
        Group {
            switch navigator.appState {
            case .launch:
                LaunchScreen()
            case .onboarding:
                Text("Onboarding")
            case .loggedIn:
                NavigationStack(path: $navigator.path) {
                    Button {
                        navigator.push(.movieDetails)
                    } label: {
                        Text("Go to Movies List")
                    }
                    .registerDesintations()
                }
            case .loggedOut:
                Text("Logged Out")
            }
        }
        .animation(.bouncy, value: navigator.appState)
        .environmentObject(navigator)
        .environmentObject(appViewModel)
        .environmentObject(sceneViewModel)
    }
}

#Preview {
    MoviesDBApp(
        navigator: .init(),
        sceneViewModel: .init(),
        appViewModel: .init()
    )
}
