//
//  ShowCreateTask.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/10/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

enum ShowCreateTask {
    enum Create {
        struct Request {
            var task: Task?
            var error: Error?
            
            init(_ task: Task?) {
                self.task = task
            }
            
            init(error: Error? = nil) {
                self.error = error
            }
        }
    }
}
