//
//  AppDelegate.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

func bootStrapLogger() {
    #if PROD
    LoggingSystem.bootstrap(NoOpLogger.init)
    #elseif STAGE
    LoggingSystem.bootstrap(NoOpLogger.init)
    #elseif DEV
    LoggingSystem.bootstrap(CombinedLogger.init)
    #elseif QA
    LoggingSystem.bootstrap(FileLogger.init)
    #else
    LoggingSystem.bootstrap(CombinedLogger.init)
    #endif
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
