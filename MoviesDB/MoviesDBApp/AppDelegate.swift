//
//  AppDelegate.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import UIKit
import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init() {
        super.init()
        bootStrapLogger()
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        log.trace("App Launched")
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // Create configuration programmatically
        let config = UISceneConfiguration(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        // Attach your SceneDelegate class
        config.delegateClass = SceneDelegate.self
        return config
    }
}
