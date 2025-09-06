//
//  AnyCancellable+Cancellation.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 07/09/25.
//

import Combine
import Foundation

extension AnyCancellable: CancellationId {
    @discardableResult
    func store(in bag: inout CancellableBag, as id: CancellationId) -> Self {
        bag.add(id: id, cancellable: self)
        return self
    }

    @discardableResult
    func store(in bag: inout CancellableBag) -> ObjectIdentifier {
        bag.add(cancellable: self)
    }
}
