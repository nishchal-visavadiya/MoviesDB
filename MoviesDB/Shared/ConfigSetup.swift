//
//  ConfigSetup.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Shared

enum ConfigSetup {
    
    private static let environment: Environment = {
        #if DEV
        return .dev
        #elseif PROD
        return .prod
        #else
        fatalError("No environment set")
        #endif
    }()

    private static let compilerFlag: CompilerFlag = {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }()
    
    static func setup() {
        Config.setEnvironment(environment)
        Config.setCompilerFlag(compilerFlag)
    }
}
