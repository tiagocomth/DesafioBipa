//
//  Endpoint.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

/// Describes a network endpoint capable of producing a URLRequest.
/// Conforming types specify base URL, path, HTTP method, headers, and parameters.
protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var urlRequest: URLRequest? { get }
}

extension Endpoint {
    /// Builds a URLRequest from the endpoint configuration.
    /// - Encodes GET parameters as URL query items when provided as [String: String].
    /// - Encodes POST parameters as a JSON body.
    /// - Applies headers and HTTP method to the request.
    var urlRequest: URLRequest? {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.path = "/" + path
        
        if method == .get, let parameters = parameters as? [String: String] {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        if method == .post, let parameters = parameters {
            let jsonData: Data
            
            do {
                jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                return nil
            }
            
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
        }

        return urlRequest
    }
}
