//
//  TasksPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI

protocol TasksPresentationLogic {
    func present(response: ShowTasks.Get.Response)
}

class TasksPresenter: TasksPresentationLogic {
    @ObservedObject var viewModel: TasksViewModel

    init(viewModel: TasksViewModel) {
        self.viewModel = viewModel
    }
    
    func present(response: ShowTasks.Get.Response) {
        if let error = response.error {
            self.viewModel.isError = true
            self.viewModel.isLoading = false
            self.viewModel.error = error
        } else {
            self.viewModel.isLoading = !self.viewModel.isLoading
            self.viewModel.tasks = response.tasks!
        }
    }
}
