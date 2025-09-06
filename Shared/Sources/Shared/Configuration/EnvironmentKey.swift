//
//  EnvironmentKey.swift
//  Shared
//
//  Created by Nishchal Visavadiya on 06/09/25.
//

import Foundation

@propertyWrapper
public struct EnvironmentKey<T: LosslessStringConvertible> {
    public var wrappedValue: T
    
    public init(_ key: String) {
        guard let stringValue = ProcessInfo.processInfo.environment[key],
              let value = T(stringValue)
        else {
            fatalError("Environment variable '\(key)' not found or not convertible to \(T.self)")
        }
        self.wrappedValue = value
    }
    
    public init(_ key: String, _ defaultValue: T) {
        if let stringValue = ProcessInfo.processInfo.environment[key],
           let value = T(stringValue) {
            self.wrappedValue = value
        } else {
            self.wrappedValue = defaultValue
        }
    }
}
