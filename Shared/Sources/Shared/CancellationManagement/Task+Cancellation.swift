//
//  Task+Cancellation.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 07/09/25.
//

import Combine

extension Task {
    func store(in set: inout Set<AnyCancellable>) {
        set.insert(AnyCancellable(cancel))
    }

    @discardableResult
    func store(in bag: inout CancellableBag, as id: CancellationId) -> Self {
        bag.add(id: id, cancellable: AnyCancellable(cancel))
        return self
    }

    @discardableResult
    func store(in bag: inout CancellableBag) -> ObjectIdentifier {
        bag.add(cancellable: AnyCancellable(cancel))
    }
}
