//
//  HomeService.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

/// Abstraction for fetching and sorting node data for the Home feature.
protocol HomeServiceProtocol {
    
    func fetchNodes(_ sortOption: SortOption) async throws -> [Node]
    
}
/// Concrete implementation of HomeServiceProtocol backed by a NetworkClient.
final class HomeService: HomeServiceProtocol {
    
    let network: NetworkClientProtocol
    
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    /// Fetches nodes from the Mempool API according to a given sort option.
    func fetchNodes(_ sortOption: SortOption) async throws -> [Node] {
        
        let endpoint = MempoolAPI.sortEndpoint(sortOption)
        
        let nodes: [Node] = try await network.request(endpoint)
        return nodes
    }
    
}
