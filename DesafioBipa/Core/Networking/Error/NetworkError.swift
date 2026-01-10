//
//  NetworkError.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noDataReceived
    case decodingError
    case badRequest
    case unknownError
}
