//
//  CalcellationManagement.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 07/09/25.
//

import Combine

protocol CancellationId: AnyObject {
    var cancellationId: ObjectIdentifier { get }
}

extension CancellationId {
    var cancellationId: ObjectIdentifier {
        ObjectIdentifier(self)
    }
}

struct CancellableBag {
    private var taskBag: [ObjectIdentifier: AnyCancellable] = [:]

    mutating func cancel(id: CancellationId) {
        let idValue = id.cancellationId
        taskBag[idValue]?.cancel()
        taskBag.removeValue(forKey: idValue)
    }

    mutating func cancelAll() {
        taskBag.values.forEach { $0.cancel() }
        taskBag.removeAll()
    }

    mutating func add(id: CancellationId, cancellable: AnyCancellable) {
        let idValue = id.cancellationId
        taskBag[idValue]?.cancel()
        taskBag[idValue] = cancellable
    }

    @discardableResult
    mutating func add(cancellable: AnyCancellable) -> ObjectIdentifier {
        let idValue = cancellable.cancellationId
        taskBag[idValue]?.cancel()
        taskBag[idValue] = cancellable
        return idValue
    }
}
