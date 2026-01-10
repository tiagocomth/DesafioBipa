//
//  HomeService.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

protocol HomeServiceProtocol {
    
    func fetchNodes() async throws -> [Node]
    
}

final class HomeService: HomeServiceProtocol {
    
    let network: NetworkClientProtocol
    
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    func fetchNodes() async throws -> [Node] {
        let endpoint = MempoolAPI.lightingNodes
        let nodes: [Node] = try await network.request(endpoint)
        return nodes
    }
    
}
