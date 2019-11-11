//
//  LoginUseCaseFactoryTests.swift
//  CleanArchictetureTests
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import XCTest

@testable import CleanArchicteture

class LoginUseCaseFactoryTests: XCTestCase {
    func test_createdUseCase_hasComposedOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer
        
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseAnalyticsLoginTracker.self), 1)
        
    }
}


private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T}.count
    }
}
