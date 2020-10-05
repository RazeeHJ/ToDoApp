//
//  ShowDashboard.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

enum ShowDashboard {
    struct DisplayedDashboard {
        var id: Int
        var model: Block?
        
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
            var blocks: [Block]?
            var error: String?
            
            init(_ blocks: [Block]?) {
                self.blocks = blocks
            }
            
            init(error: String? = "") {
                self.error = error
            }
        }
    }
}
