//
//  LoginUseCaseFactory.swift
//  CleanArchicteture
//
//  Created by Thiago B Claramunt on 11/11/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

final class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
                LoginPresenter(),
                CrashlyticsLoginTracker(),
                FirebaseAnalyticsLoginTracker()
            ]))
    }
}

