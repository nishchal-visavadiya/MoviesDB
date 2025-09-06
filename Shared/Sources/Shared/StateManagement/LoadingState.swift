//
//  LoadingState.swift
//  Shared
//
//  Created by Nishchal Visavadiya on 07/09/25.
//

enum LoadingState<T> {
    case failure(Error?)
    case initial
    case loading
    case success(T)
}

extension LoadingState {
    var isLoading: Bool {
        switch self {
        case .loading:
            true
        default:
            false
        }
    }

    var isSuccess: Bool {
        switch self {
        case .success:
            true
        default:
            false
        }
    }

    var isFailure: Bool {
        switch self {
        case .failure:
            true
        default:
            false
        }
    }

    var data: T? {
        switch self {
        case let .success(data):
            data
        default:
            nil
        }
    }
}

extension LoadingState where T == Void {
    static var success: LoadingState {
        .success(())
    }
}

extension LoadingState {
    static var failure: LoadingState {
        .failure(nil)
    }
}
