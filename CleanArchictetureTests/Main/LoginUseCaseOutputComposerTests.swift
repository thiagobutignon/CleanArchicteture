//
//  LoginUseCaseOutputComposerTests.swift
//  CleanArchictetureTests
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import XCTest
@testable import CleanArchicteture

class LoginUseCaseOutputComposesTests: XCTestCase {
    func test_composingZeroOutputs_doesNotCrash() {
        let sut = LoginUseCaseOutputComposer([])
        sut.loginSucceded()
        sut.loginFailed()
    }

    
    func test_composingMultipleOutputs_delegatesSuccededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()

        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginSucceded()
        
        XCTAssertEqual(output1.loginSuccededCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)
        
        XCTAssertEqual(output2.loginSuccededCallCount, 1)
        XCTAssertEqual(output2.loginFailedCallCount, 0)
    }
    
    func test_composingMultipleOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()

        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailed()
        
        XCTAssertEqual(output1.loginFailedCallCount, 1)
        XCTAssertEqual(output1.loginSuccededCallCount, 0)
        
        XCTAssertEqual(output2.loginFailedCallCount, 1)
        XCTAssertEqual(output2.loginSuccededCallCount, 0)
        
    }

    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSuccededCallCount: Int = 0
        var loginFailedCallCount: Int = 0
        
        func loginSucceded() {
            loginSuccededCallCount += 1
        }
        
        func loginFailed() {
            loginFailedCallCount += 1
        }
    }
}
