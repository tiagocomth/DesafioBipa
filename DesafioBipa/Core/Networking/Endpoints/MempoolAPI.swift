//
//  MempoolAPI.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 10/01/26.
//

import Foundation

enum MempoolAPI {
    case lightingNodes
}

extension MempoolAPI: Endpoint {
    var baseURL: URL {
        URL(string: "https://mempool.space")!
    }
    
    var path: String {
        switch self {
        case .lightingNodes:
            return "api/v1/lightning/nodes/rankings/connectivity"
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
