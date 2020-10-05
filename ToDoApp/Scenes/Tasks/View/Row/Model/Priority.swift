//
//  Priority.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Priority: Identifiable, Codable {
    @DocumentID var id: String?
    var priorityType: PriorityType
    var color: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case priorityType
        case color
    }
}
