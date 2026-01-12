//
//  NetworkClient.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

/// Concrete HTTP client that performs requests and decodes JSON responses.
/// Conforms to `NetworkClientProtocol` to allow mocking and easier testing.
final class NetworkClient: NetworkClientProtocol {
    
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T>(_ endpoint: any Endpoint) async throws -> T where T : Decodable {
        
        guard let request = endpoint.urlRequest else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, response) = try await session.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                throw NetworkError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                /// Decoding failed for the expected type.
                throw NetworkError.badRequest
            }
        } catch {
            throw NetworkError.badRequest
        }
    }
    
}
