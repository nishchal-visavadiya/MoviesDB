//
//  AppView.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import SwiftUI

struct AppView: View {
    
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    AppView()
}
