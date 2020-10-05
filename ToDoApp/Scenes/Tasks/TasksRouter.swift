//
//  TasksRouter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

class TasksRouter {
    func router() -> some View {
        let viewModel = TasksViewModel()
        let worker = FirestoreWorker()
        let presenter =  TasksPresenter(viewModel: viewModel)
        let mapper = TasksMapper()
        let interactor = TasksInteractor(worker: worker, presenter: presenter, mapper: mapper)
        viewModel.interactor = interactor
        return TasksView(viewModel: viewModel)
    }
}
