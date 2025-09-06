//
//  ConsoleLogger.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

final class ConsoleLogger: LogHandler, @unchecked Sendable {
    
    // MARK: Public properties
    var logLevel: Logger.Level = .trace
    var metadata: Logger.Metadata = [:]
    
    // MARK: Private properties
    private let logQueue = DispatchQueue(label: "com.consoleLogger.queue")
    private let label: String

    init(label: String) {
        self.label = label
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
        let timestamp = localForamttedTimeStamp()
        let otherInfo = "\(file) \(function):\(line)"
        let logEntry = "\(otherInfo)\n\(timestamp) - \(level.emoji) : \(message)"
        
        logQueue.async {
            print(logEntry)
        }
    }
}
