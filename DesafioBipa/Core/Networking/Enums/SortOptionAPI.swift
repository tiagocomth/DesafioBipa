//
//  SortOptionAPI.swift
//  DesafioBipa
//
//  Created by Thiago de Jesus on 11/01/26.
//

import Foundation

protocol SortOptionAPI {
    static func getAPISorted<T: Endpoint>(_ sortOption: SortOption) -> T
}
