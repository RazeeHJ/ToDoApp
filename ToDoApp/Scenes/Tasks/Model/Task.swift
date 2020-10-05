//
//  TaskModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var name: String?
    var description: String?
    var date: Date?
    var priorityType: PriorityType?
    var completed: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case date
        case priorityType
        case completed
    }
}

extension DocumentID: Hashable where Value: Hashable {
    static func == (lhs: DocumentID, rhs: DocumentID) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}
