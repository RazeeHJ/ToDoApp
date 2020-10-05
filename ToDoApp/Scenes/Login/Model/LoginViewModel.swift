//
//  AppViewModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    let objectWillChange = PassthroughSubject<LoginViewModel, Never>()
    
    @Published var user: UserProfile?
    @Published var error: Error?
    
    var isLoggedIn: Bool = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var interactor: LoginBusinessLogic!
    
    func login() {
        self.interactor.login()
    }
}
