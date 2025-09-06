//
//  AppDelegate.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Shared
import Logging

func bootStrapLogger() {
    print("Bootstrapping Logger for \(Config.environment) environment and \(Config.compilerFlag) compiler flag")
    switch Config.environment {
    case .dev:
        LoggingSystem.bootstrap(CombinedLogger.init)
    case .prod:
        LoggingSystem.bootstrap(NoOpLogger.init)
    }
}

let log: Logger = {
    return Logger(label: Bundle.main.bundleIdentifier ?? "NoBundleID")
}()

extension Logger {
    
    public func error(
        _ errorToLog: Error,
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        error(errorToLog.log, metadata: metadata(), file: file, function: function, line: line)
    }
}

extension String {
    
    public var log: Logger.Message {
        .init(stringLiteral: self)
    }
}

extension Error {
    
    public var log: Logger.Message {
        localizedDescription.log
    }
}
