//
//  Logging+Emoji.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

extension Logger.Level {
    
    var emoji: String {
        switch self {
        case .trace:
            "✨"
        case .debug:
            "🧩"
        case .info:
            "📢"
        case .notice:
            "🔔"
        case .warning:
            "⚠️"
        case .error:
            "‼️"
        case .critical:
            "❌"
        }
    }
}
