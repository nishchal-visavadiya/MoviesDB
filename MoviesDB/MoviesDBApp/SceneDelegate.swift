//
//  SceneDelegate.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        initialiseAppScene(window: window)
    }
    
    private func initialiseAppScene(window: UIWindow?) {
        // Create SwiftUI root view
        let rootView = MoviesDBApp(
            navigator: .init(),
            sceneViewModel: .init(),
            appViewModel: .init()
        )
        // Use UIHostingController to bridge SwiftUI → UIKit
        let hostingController = UIHostingController(rootView: rootView)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()
    }
}
