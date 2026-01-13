//
//  HomeServiceTests.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import XCTest
@testable import DesafioBipa

/// Unit tests for `HomeService`.
///
/// Scope:
/// - Verify that `HomeService` builds and uses the correct endpoint when fetching nodes,
///   according to the provided `SortOption`.
/// - Isolate the real networking layer using `networkClientMock` so no real HTTP calls are made.
///
/// Implementation details:
/// - `networkClientMock` captures the requested `Endpoint` via its `requestedEndpoint` property,
///   allowing assertions about `path`, HTTP method, etc.
/// - The current test focuses on `SortOption.connectivity`, comparing the requested `path`
///   to the `path` mapped by `MempoolAPI.sortEndpoint(.connectivity)`.
/// - The `@MainActor` annotation matches the async/await usage and prevents warnings if
///   `HomeService` or its callers are main-actor-bound.
final class HomeServiceTests: XCTestCase {
    
    var sut: HomeService!
    var mockNetwork: networkClientMock!


    override func setUp() {
        mockNetwork = networkClientMock()
        sut =  HomeService(network: mockNetwork)

    }

    override func tearDown()  {
        mockNetwork = nil
        sut = nil
    }

    @MainActor
    func testHomeService_UsesCorrectEndpoint() async throws {
        _ = try await sut.fetchNodes(.connectivity)
        XCTAssertEqual(mockNetwork.requestedEndpoint?.path, MempoolAPI.sortEndpoint(.connectivity).path)
    }

}
