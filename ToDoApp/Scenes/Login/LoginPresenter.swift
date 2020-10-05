//
//  LoginPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI

protocol LoginPresentationLogic {
    func present(response: ShowUser.Get.Response)
}

class LoginPresenter: LoginPresentationLogic {
    @ObservedObject var viewModel: LoginViewModel
    
    init(model: LoginViewModel) {
        self.viewModel = model
    }
    
    func present(response: ShowUser.Get.Response) {
        if let error = response.error {
            self.viewModel.error = error
        } else {
            self.viewModel.user = response.user!
            self.viewModel.isLoggedIn = true
        }
    }
}
