//
//  HomeViewModelTests.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import XCTest
import Combine
@testable import DesafioBipa

/// Unit tests for `HomeViewModel`.
///
/// Scope:
/// - Verify that changing `sortOption` triggers a new nodes request by observing `isLoading`.
/// - Verify that `isLoading` returns to `false` after `requestNodes()` completes.
///
/// Implementation details:
/// - Uses a `MockHomeService` to isolate the view model from real networking and to control timing.
/// - Observes the `@Published` property `isLoading` via Combine to detect request start/finish.
/// - Annotated with `@MainActor` to match UI-bound behavior and avoid actor-related issues in tests.
@MainActor
final class HomeViewModelTests: XCTestCase {
    
    var homeViewModel: HomeViewModel!

    override func setUp()  {
        homeViewModel = HomeViewModel(service: MockHomeService())
    }

    override func tearDown()  {
        homeViewModel = nil
    }

    func test_whenSortOptionChanges_shouldRequestNodes() async {
        /// Creates an expectation to wait for an async event.
        let expectation = XCTestExpectation(description: "Request should be called")
        
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
