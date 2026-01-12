//
//  HomeViewModelTests.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import XCTest
import Combine
@testable import DesafioBipa


@MainActor
final class HomeViewModelTests: XCTestCase {
    
    var homeViewModel: HomeViewModel!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_whenSortOptionChanges_shouldRequestNodes() async {
        /// Creates an expectation to wait for an async event.
        let expectation = XCTestExpectation(description: "Request should be called")
        homeViewModel = HomeViewModel(service: MockHomeService())
        
        XCTAssertFalse(homeViewModel.isLoading)
                
        let cancellables = homeViewModel.$isLoading
            .dropFirst()
            .sink { isLoading in
            /// When isLoading becomes true, it indicates a new request was triggered.
            if isLoading == true {
                expectation.fulfill( )
            }
        }
        
        homeViewModel.sortOption = .age
        await fulfillment(of: [expectation], timeout: 2)
        
        cancellables.cancel()

    }
    
    /// Tests that when `requestNodes()` finishes, the `isLoading` property
    /// is set back to `false`.
    func test_whenRequestNodesFinishes_shouldSetIsLoadingToFalse() async {
        
        //Given
        // Creates an expectation to wait for an async event.
        let expectation = XCTestExpectation(description: "Request should be called")
        homeViewModel = HomeViewModel(service: MockHomeService())
        
        XCTAssertFalse(homeViewModel.isLoading)
        
        let cancellables = homeViewModel.$isLoading
            .dropFirst()
            .sink { isLoading in
                if isLoading == false {
                    expectation.fulfill( )
                }
            }
        
        //When
        await homeViewModel.requestNodes()
        
        //Then
        await fulfillment(of: [expectation], timeout: 2)
        
        cancellables.cancel()
    }

}
