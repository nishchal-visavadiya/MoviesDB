//
//  FileLogger.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation
import Logging

final class FileLogger: LogHandler {
    
    // MARK: Public properties
    var logLevel: Logger.Level = .trace
    var metadata: Logger.Metadata = [:]
    
    // MARK: Private properties
    private var fileHandle: FileHandle?
    private let logQueue = DispatchQueue(label: "com.filelogger.queue")
    private let label: String

    init(label: String) {
        self.label = label
        createLogFileIfNeeded()
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
        logQueue.async { [weak self] in
            let logWithNewline = logEntry + "\n"
            if let data = logWithNewline.data(using: .utf8) {
                self?.fileHandle?.write(data)
            }
        }
    }
    
    private func createLogFileIfNeeded() {
        guard let rootDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Can not find root directory to write logs")
        }
        
        let logsRootDir = rootDirectory.appendingPathComponent("logs", isDirectory: true)
        let logsDir = logsRootDir.appendingPathComponent(label, isDirectory: true)
        if !FileManager.default.fileExists(atPath: logsDir.path(percentEncoded: false)) {
            do {
                try FileManager.default.createDirectory(at: logsDir, withIntermediateDirectories: true, attributes: nil)
            } catch {
                fatalError("Failed to create logs directory: \(error)")
            }
        }
        let dateString = localForamttedDate()
        let logFileURL = logsDir.appendingPathComponent("\(label)_\(dateString).log")
        if !FileManager.default.fileExists(atPath: logFileURL.path(percentEncoded: false)) {
            do {
                try "".write(to: logFileURL, atomically: true, encoding: .utf8)
            } catch {
                fatalError("Failed to create log file: \(error)")
            }
        }

        do {
            fileHandle = try FileHandle(forWritingTo: logFileURL)
            fileHandle?.seekToEndOfFile()
        } catch {
            fatalError("Failed to open log file for writing: \(error)")
        }
    }
    
    deinit {
        try? fileHandle?.close()
    }
}
