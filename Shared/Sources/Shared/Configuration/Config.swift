//
//  Config.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation

public enum Environment: Sendable {
    case dev
    case prod
}

public enum CompilerFlag: Sendable {
    case debug
    case release
}

public enum Config {
    
    nonisolated(unsafe) private static var _environment: Environment? = nil
    public static var environment: Environment {
        get {
            if let env = _environment {
                return env
            } else {
                fatalError("No environment set")
            }
        }
    }
    
    nonisolated(unsafe) private static var _compilerFlag: CompilerFlag? = nil
    public static var compilerFlag: CompilerFlag {
        get {
            if let flag = _compilerFlag {
                return flag
            } else {
                fatalError("No compiler flag set")
            }
        }
    }
    
    public static func setEnvironment(_ environment: Environment) {
        _environment = environment
    }
    
    public static func setCompilerFlag(_ compilerFlag: CompilerFlag) {
        _compilerFlag = compilerFlag
    }
}
