//
//  CreateTaskPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/10/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI

protocol CreateTaskPresentationLogic {
    func present(response: ShowCreateTask.Create.Request)
}

class CreateTaskPresenter: CreateTaskPresentationLogic {
    @ObservedObject var viewModel: CreateTaskViewModel
    
    init(viewModel: CreateTaskViewModel) {
        self.viewModel = viewModel
    }
    
    func present(response:  ShowCreateTask.Create.Request) {
        self.viewModel.tasks.append(response.task!)
    }
}
