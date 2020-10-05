//
//  LoginInteractor.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

protocol LoginBusinessLogic {
    func login()
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic
    var mapper: LoginMapperDisplayLogic
    var model: UserProfile?
    
    var googleLoginService: GoogleLoginWorker
    var worker: FirestoreProtocol
    
    init(presenter: LoginPresentationLogic, mapper: LoginMapperDisplayLogic, googleLoginService: GoogleLoginWorker, worker: FirestoreProtocol) {
        self.presenter = presenter
        self.mapper = mapper
        self.googleLoginService = googleLoginService
        self.worker = worker
    }
    
    func login() {
        self.signIn { (user) in
            self.authenticate(with: user)
        }
    }
    
    func signIn(completion: @escaping (GIDGoogleUser) -> Void) {
        self.googleLoginService.signIn { (user, error) in
            guard let user = user else {
                return
            }
            completion(user)
        }
    }
    
    func authenticate(with user: GIDGoogleUser) {
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                self.presenter.present(response: ShowUser.Get.Response(error: error))
            } else {
                guard let user = result?.user else {return}
                let mapper = self.mapper.mapToDisplayModel(from: user)
                self.presenter.present(response: mapper)
            }
        }
    }
}
