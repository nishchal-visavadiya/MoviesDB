//
//  APIServiceError+PresentableError.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation
import SwiftUI
import Networking

extension APIServiceError: PresentableError {
    
    var title: LocalizedStringKey {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed:
            return "Request Failed"
        case .decodingFailed:
            return "Decoding Failed"
        case .queryParameterEncodingFailed:
            return "Parameter Encoding Failed"
        case .requestBodyEncodingFailed:
            return "Body Encoding Failed"
        }
    }
    
    var message: LocalizedStringKey {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .requestFailed:
            return "The network request failed. Please try again."
        case .decodingFailed:
            return "Failed to decode the response."
        case .queryParameterEncodingFailed:
            return "Failed to encode query parameters."
        case .requestBodyEncodingFailed:
            return "Failed to encode request body."
        }
    }
}
