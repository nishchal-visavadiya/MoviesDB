//
//  Debouncer.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 07/09/25.
//

import Foundation

final class Debouncer: Sendable {
    private nonisolated(unsafe) var task: Task<Void, Error>?
    private nonisolated(unsafe) var debouceTime: Duration

    init(debouceTime: Duration) {
        self.debouceTime = debouceTime
    }

    func debounce(
        waitForDebounce: Bool = true,
        execute action: @escaping @Sendable () async throws -> Void
    ) {
        task?.cancel()
        task = Task {
            if waitForDebounce {
                await delay(by: debouceTime)
            }
            try Task.checkCancellation()
            try await action()
        }
    }

    func cancel() {
        task?.cancel()
        task = nil
    }
}
