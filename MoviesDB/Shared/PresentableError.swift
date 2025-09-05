//
//  PresentableError.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 01/09/25.
//

import Foundation
import SwiftUICore

protocol PresentableError: Error {
    var title: LocalizedStringKey { get }
    var message: LocalizedStringKey { get }
}
