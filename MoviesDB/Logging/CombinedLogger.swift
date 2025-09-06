//
//  CombinedLogger.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

final class CombinedLogger: LogHandler, @unchecked Sendable {
    
    // MARK: Public properties
    var logLevel: Logger.Level = .trace
    var metadata: Logger.Metadata = [:]
    
    // MARK: Private properties
    private let fileLogger: FileLogger
    private let consoleLogger: ConsoleLogger
    private let label: String

    init(label: String) {
        self.label = label
        self.fileLogger = FileLogger(label: label)
        self.consoleLogger = ConsoleLogger(label: label)
    }

    subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get { nil }
        // swiftlint:disable:next unused_setter_value
        set { /* Metadata is not used in this implementation */ }
    }

    func log(
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata?,
        source: String,
        file: String,
        function: String,
        line: UInt
    ) {
        // Forward the log message to both loggers
        fileLogger.log(
            level: level,
            message: message,
            metadata: metadata,
            source: source,
            file: file,
            function: function,
            line: line
        )
        
        consoleLogger.log(
            level: level,
            message: message,
            metadata: metadata,
            source: source,
            file: file,
            function: function,
            line: line
        )
    }
}
