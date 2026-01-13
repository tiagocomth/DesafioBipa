//
//  MempoolAPI.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

/// Endpoints for Mempool.space Lightning rankings API.
enum MempoolAPI {
    /// Ranking by graph connectivity.
    case lightningNodesByConnectivity
    /// Ranking by liquidity/capacity.
    case lightningNodesByLiquidity
    /// Ranking by node age (oldest first).
    case lightningNodesByAge
}

extension MempoolAPI: Endpoint {
    /// Base URL for all Mempool endpoints.
    var baseURL: URL {
        URL(string: "https://mempool.space")!
    }
    
    /// Path component for the selected ranking.
    var path: String {
        switch self {
        case .lightningNodesByConnectivity:
            return "api/v1/lightning/nodes/rankings/connectivity"
        case .lightningNodesByLiquidity:
            return "api/v1/lightning/nodes/rankings/liquidity"
        case .lightningNodesByAge:
            return "api/v1/lightning/nodes/rankings/age"
        }
    }
    
    /// HTTP method used for all requests (read-only).
    var method: HTTPMethod {
        .get
    }
    
    /// Default headers for JSON requests.
    var headers: [String : String]? {
        return [ "Content-Type": "application/json"]
    }
    
    /// No query/body parameters required for these endpoints.
    var parameters: [String : Any]? {
        nil
    }
}

extension MempoolAPI {
    /// Maps a SortOption to the corresponding MempoolAPI endpoint.
    static func sortEndpoint(_ sort: SortOption) -> MempoolAPI {
        switch sort {
        case .connectivity:
            return .lightningNodesByConnectivity
        case .liquidity:
            return .lightningNodesByLiquidity
        case .age:
            return .lightningNodesByAge
        }
    }
}
