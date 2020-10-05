//
//  TasksMapper.swift
//  ToDoApp
//
//  Created by SRazee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol TasksMapperDisplayLogic {
    func mapToDisplayLogic(from data:  QueryDocumentSnapshot, id: String) -> ShowTasks.DisplayedTasks
}

class TasksMapper: TasksMapperDisplayLogic {
    func mapToDisplayLogic(from data: QueryDocumentSnapshot, id: String) -> ShowTasks.DisplayedTasks {
        var displayed = ShowTasks.DisplayedTasks()
        var model = Task()
        model.id = id
        model.name = data["name"] as? String
        model.description = data["description"] as? String
        model.date = data["date"] as? Date
        model.priorityType = (data["priorityType"] as? String).map { PriorityType(rawValue: $0)! }
        model.completed = data["completed"] as? Bool ?? false
        
        displayed.model = model
        return displayed
    }
}
