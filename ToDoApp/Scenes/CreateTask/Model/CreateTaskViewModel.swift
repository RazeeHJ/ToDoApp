//
//  CreateTaskViewModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI
import Combine

class CreateTaskViewModel: ObservableObject, Identifiable {
    @Published var tasks = [Task]()
    @Published var error: Error?

    var interactor: CreateTaskBusinessLogic!
    
    func create(with task: Task) {
        interactor.create(with: handleCreateTaskRequest(task))
    }

    private func handleCreateTaskRequest(_ task: Task) -> ShowCreateTask.Create.Request {
        return ShowCreateTask.Create.Request(task)
    }
}


