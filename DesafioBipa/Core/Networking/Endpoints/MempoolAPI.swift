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
        URL(string: "https://mempool.space/api/v1")!
    }
    
    var path: String {
        switch self {
        case .lightingNodes:
            return "/lightning/nodes/rankings/connectivity"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    
}
