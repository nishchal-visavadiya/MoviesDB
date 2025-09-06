//
//  APIServiceImpl.swift
//  MoviesDB
//
//  Created by Nishchal Visavadiya on 05/09/25.
//

import Foundation

final class APIServiceImpl: APIService {
    
    private let urlSession: URLSession
    private let successStatusCodes: Range<Int>
    
    init(
        urlSession: URLSession = .shared,
        successStatusCodes: Range<Int> = 200..<300
    ) {
        self.urlSession = urlSession
        self.successStatusCodes = successStatusCodes
    }
    
    func call<T>(endpoint: TMDBEndpoint) async throws -> T where T : Decodable {
        try await call(endpoint: endpoint)
    }
    
    func call<T>(endpoint: TMDBEndpoint, body: any Encodable) async throws -> T where T : Decodable {
        try await call(endpoint: endpoint, body: body)
    }
    
    func call<T>(endpoint: TMDBEndpoint, queryParams: any Encodable) async throws -> T where T : Decodable {
        try await call(endpoint: endpoint, queryParams: queryParams)
    }
    
    func call<T>(endpoint: TMDBEndpoint, queryParams: any Encodable, body: any Encodable) async throws -> T where T : Decodable {
        try await call(endpoint: endpoint, queryParams: queryParams, body: body)
    }
    
    private func call<T: Decodable>(
        endpoint: TMDBEndpoint,
        queryParams: Encodable? = nil,
        body: Encodable? = nil
    ) async throws -> T {
        guard var urlComponents = URLComponents(string: endpoint.fullEndpoint) else {
            throw APIServiceError.invalidURL
        }
        var queryItems: [URLQueryItem] = []
        if let queryParams {
            for (key, value) in try queryParams.toDictionary() {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponents.queryItems = queryItems
        }
        try Task.checkCancellation()
        guard let url = urlComponents.url else {
            throw APIServiceError.invalidURL
        }
        var request = URLRequest(url: url)
        if let body {
            let bodyData = try body.toData()
            request.httpBody = bodyData
        }
        for (key, value) in endpoint.headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = endpoint.method.stringValue
        try Task.checkCancellation()
        let data = try await callRequest(request)
        try Task.checkCancellation()
        return try decodeData(data)
    }
    
    private func callRequest(_ request: URLRequest) async throws -> Data {
        do {
            let (data, response) = try await urlSession.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  successStatusCodes.contains(httpResponse.statusCode) else {
                throw APIServiceError.requestFailed
            }
            
            return data
        } catch {
            throw APIServiceError.requestFailed
        }
    }
    
    private func decodeData<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIServiceError.decodingFailed
        }
    }
}

private extension Encodable {
    
    func toDictionary() throws -> [String: String] {
        do {
            // Convert Encodable to Data
            let data = try JSONEncoder().encode(self)
            
            // Decode as [String: Any]
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let dict = jsonObject as? [String: Any] else {
                throw APIServiceError.queryParameterEncodingFailed
            }
            // Convert Any values to String
            var stringDict: [String: String] = [:]
            for (key, value) in dict {
                stringDict[key] = "\(value)"
            }
            return stringDict
        } catch {
            throw APIServiceError.queryParameterEncodingFailed
        }
    }
    
    func toData() throws -> Data {
        do {
            // Convert Encodable to Data
            return try JSONEncoder().encode(self)
        } catch {
            throw APIServiceError.requestBodyEncodingFailed
        }
    }
}
