//
//  CrashlyticsLoginTracker.swift
//  CleanArchicteture
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

final class CrashlyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceded() {
//         send login event to crashlytics
        
    }
    
    func loginFailed() {
//        Enviar os erros para o crashlytics
    }
}
