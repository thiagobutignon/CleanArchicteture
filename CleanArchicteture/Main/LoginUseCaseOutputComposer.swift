//
//  LoginUseCaseOutputComposer.swift
//  CleanArchicteture
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSucceded() {
        outputs.forEach { $0.loginSucceded() }
    }
    
    func loginFailed() {
        outputs.forEach {$0.loginFailed() }
    }
    
}

func compose<T>(_ outputs: [(T) -> Void]) -> (T) -> Void {
    return { value in
        outputs.forEach { $0(value)}
    }
}
