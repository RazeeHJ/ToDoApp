//
//  LoginRouter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

class LoginRouter {
    func router(_ viewModel: LoginViewModel) -> some View {
        let loginService = GoogleLoginWorker()
        let worker = FirestoreWorker()
        let presenter =  LoginPresenter(model: viewModel)
        let mapper = LoginMapper()
        let interactor = LoginInteractor(presenter: presenter, mapper: mapper, googleLoginService: loginService, worker: worker)

        viewModel.interactor = interactor
        return LoginView(viewModel: viewModel)
    }
}
