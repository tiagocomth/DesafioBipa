//
//  MempoolAPI.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

enum MempoolAPI {
    case lightningNodesByConnectivity
    case lightningNodesByLiquidity
    case lightningNodesByAge
}

extension MempoolAPI: Endpoint {
    var baseURL: URL {
        URL(string: "https://mempool.space")!
    }
    
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
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        return [ "Content-Type": "application/json"]
    }
    
    var parameters: [String : Any]? {
        nil
    }
}

extension MempoolAPI {
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
