//
//  ShowTasks.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

enum ShowTasks {
    struct DisplayedTasks {
        var id: Int
        var model: Task?
        
        var objectKey: String {
            return "\(id ?? 0)"
        }
        
        init() {
            self.id = 0
            self.model = nil
        }
    }
    
    enum Get {
        struct Response {
            var tasks: [Task]?
            var error: String?
            
            init(_ tasks: [Task]?) {
                self.tasks = tasks
            }
            
            init(error: String? = "") {
                self.error = error
            }
        }
    }
    
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
