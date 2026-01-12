//
//  NetworkClientProtocol.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import Foundation
@testable import DesafioBipa

final class networkClientMock: NetworkClientProtocol {
    
    var requestedEndpoint: Endpoint?
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        requestedEndpoint = endpoint
        return [] as! T
    }

}
