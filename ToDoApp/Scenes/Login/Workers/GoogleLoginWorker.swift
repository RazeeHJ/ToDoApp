//
//  GoogleLoginWorker.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import GoogleSignIn

class GoogleLoginWorker: NSObject {
    let googleSignIn: GIDSignIn
    private var googleCallback: ((GIDGoogleUser?, Error?) -> Void)?
    
    init(googleSignIn: GIDSignIn = GIDSignIn.sharedInstance()) {
        self.googleSignIn = googleSignIn
        super.init()
        self.googleSignIn.clientID = ""
        self.googleSignIn.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        self.googleSignIn.delegate = self
    }
    
    func signIn(completion: @escaping (_ user: GIDGoogleUser?, _ error: Error?) -> Void) {
        self.googleCallback = completion
        self.googleSignIn.signIn()
    }
}

extension GoogleLoginWorker: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            self.googleCallback?(nil, error)
            return
        }
        self.googleCallback?(user, nil)
    }
}
