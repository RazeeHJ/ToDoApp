//
//  LoginPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol LoginMapperDisplayLogic {
    func mapToDisplayModel(from userInfo: User) -> ShowUser.Get.Response
}

class LoginMapper: LoginMapperDisplayLogic  {
    func mapToDisplayModel(from userInfo: User) -> ShowUser.Get.Response {
        var model = UserProfile()
        
        model.email = userInfo.email ?? ""
        model.displayName = userInfo.displayName ?? ""
        model.photoUrl = userInfo.photoURL
        model.isLoggedIn = true
        let response = ShowUser.Get.Response(model)
        return response
    }
}
