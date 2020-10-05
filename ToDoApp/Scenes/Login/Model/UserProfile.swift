//
//  UserModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

struct UserProfile: Identifiable {
    var id: ObjectIdentifier?
    var displayName: String = ""
    var email: String = ""
    var photoUrl: URL? = nil
    var isLoggedIn: Bool = false
}
