//
//  HomeServiceTests.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import XCTest
@testable import DesafioBipa

final class HomeServiceTests: XCTestCase {
    
    var sut: HomeService!


    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeService_UsesCorrectEndpoint() async throws {
        let mockNetwork = networkClientMock()
        sut = await HomeService(network: mockNetwork)
        _ = try await sut.fetchNodes(.connectivity)
        XCTAssertEqual(mockNetwork.requestedEndpoint?.path, MempoolAPI.sortEndpoint(.connectivity).path)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
