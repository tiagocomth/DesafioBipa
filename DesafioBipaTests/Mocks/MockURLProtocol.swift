//
//  MockURLProtocol.swift
//  DesafioBipaTests
//
//  Created by Thiago de Jesus on 12/01/26.
//

import Foundation
import XCTest

final class MockURLProtocol: URLProtocol {
    
    static var requestHandler: ((URLRequest) throws -> (Data, URLResponse))?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            guard let handler = MockURLProtocol.requestHandler else {
                XCTFail("No request handler set for MockURLProtocol")
                return
            }
            
            do{
                let (data, response) = try handler(self.request)
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                client?.urlProtocol(self, didLoad: data)
                client?.urlProtocolDidFinishLoading(self)
            } catch {
                XCTFail("Error Handling the Request")
            }
        }
    }
    
    override func stopLoading() {
        
    }
}

extension MockURLProtocol {
    static func mockResponse(statusCode: Int, json: String) {
        let data = json.data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw URLError(.badURL)
            }
            let response = HTTPURLResponse(
                url: url,
                statusCode: statusCode,
                httpVersion: nil,
                headerFields: nil
            )!
            return (data, response)
        }
    }
}
