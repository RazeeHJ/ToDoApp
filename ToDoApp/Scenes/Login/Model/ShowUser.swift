//
//  ShowUser.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamale on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

enum ShowUser {
    struct DisplayedUser {
        var id: Int
        var model: UserProfile
        
        var objectKey: String {
            return "\(id ?? 0)"
        }
    }
    
    enum Get {
        struct Response {
            var user: UserProfile?
            var error: Error?
            
            init(_ user: UserProfile?) {
                self.user = user
            }
            
            init(error: Error? = nil) {
                self.error = error
            }
        }
        
        struct ViewModel {
            var display: DisplayedUser?
        }
    }
}
