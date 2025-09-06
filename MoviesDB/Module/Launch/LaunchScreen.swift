//
//  LaunchScreen.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import SwiftUI

import SwiftUI

struct LaunchScreen: View {
    @State private var swing = false
    @EnvironmentObject private var navigator: Navigator

    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()

            Image(.appIcon)
                .resizable()
                .scaledToFit()
                .frame(width: Constant.screenWidth * 0.8)
                .rotationEffect(.degrees(swing ? 360 : -360)) // back & forth swing
                .animation(
                    .interpolatingSpring(stiffness: 10, damping: 10)
                        .speed(1)
                        .repeatForever(autoreverses: true),
                    value: swing
                )
        }
        .task {
            // start the animation
            swing = true
            // keep showing launch for a while, then navigate
            await delay(by: .seconds(2))
            navigator.appState = .loggedIn
        }
    }
}

#Preview {
    LaunchScreen()
}
