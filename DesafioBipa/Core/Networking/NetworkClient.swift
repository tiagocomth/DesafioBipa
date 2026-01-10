//
//  NetworkClient.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

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
            
            return try JSONDecoder().decode(T.self, from: data)
            
        }catch {
            throw NetworkError.badRequest
        }
        
    }
    
}
