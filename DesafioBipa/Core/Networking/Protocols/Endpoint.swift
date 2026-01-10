//
//  Endpoint.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var urlRequest: URLRequest? { get }
}

extension Endpoint {
    var urlRequest: URLRequest? {
        guard var urlComponents = URLComponents(url: baseURL.appending(component: path, directoryHint: .notDirectory), resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        if method == .get, let parameters = parameters as? [String: String] {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else {
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
