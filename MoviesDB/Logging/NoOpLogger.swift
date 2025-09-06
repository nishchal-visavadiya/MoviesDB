//
//  NoOpLogger.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

struct NoOpLogger: LogHandler {

    // MARK: Public properties
    var logLevel: Logger.Level = .trace
    var metadata: Logger.Metadata = [:]
    
    // MARK: Private properties
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
        // No operation logger does not log anything.
    }
}
