//
//  NetworkingClientProtocol.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
        
}
