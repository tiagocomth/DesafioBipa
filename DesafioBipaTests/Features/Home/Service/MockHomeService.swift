//
//  MockHomeService.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import Foundation
@testable import DesafioBipa


final class MockHomeService: HomeServiceProtocol {
    
    func fetchNodes(_ sortOption: SortOption) async throws -> [Node] {
        []
    }
}
