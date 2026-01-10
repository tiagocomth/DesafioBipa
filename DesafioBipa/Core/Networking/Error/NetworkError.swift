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

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "A URL informada é inválida."
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .noDataReceived:
            return "Nenhum dado foi recebido do servidor."
        case .decodingError:
            return "Não foi possível processar os dados recebidos."
        case .badRequest:
            return "Requisição inválida. Verifique os dados enviados."
        case .unknownError:
            return "Ocorreu um erro inesperado. Tente novamente."
        }
    }
}
