//
//  TasksViewModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI
import Combine

class TasksViewModel: ObservableObject, Identifiable {
    @Published var tasks = [Task]()
    @Published var isLoading: Bool = true
    @Published var error: String?
    @Published var isError: Bool = false
    
    var interactor: TasksBusinessLogic!
    
    func fetch() {
        self.interactor.load()
    }
    
    func update(with task: Task) {
        interactor.update(with: handleTasksRequest(task))
    }
    
    private func handleTasksRequest(_ task: Task) -> ShowTasks.Create.Request {
        return ShowTasks.Create.Request(task)
    }
}


