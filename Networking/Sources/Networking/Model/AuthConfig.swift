//
//  AuthConfig.swift
//  Networking
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Shared

struct AuthConfig {
    @EnvironmentKey("TMDB_API_BEARER_TOKEN")
    var token: String
}
