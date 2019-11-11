//
//  LoginUseCase.swift
//  CleanArchicteture
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceded()
    func loginFailed()
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }

    func login(name: String, password: String) {
        self.output.loginFailed()
        self.output.loginSucceded()
    }
}
