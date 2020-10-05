//
//  CreateTaskRouter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

class CreateTaskRouter {
    func router() -> some View {
        let viewModel = CreateTaskViewModel()
        let worker = FirestoreWorker()
        let presenter =  CreateTaskPresenter(viewModel: viewModel)
        let interactor = CreateTaskInteractor(presenter: presenter, worker: worker)
        viewModel.interactor = interactor
        return CreateTaskView(viewModel: viewModel)
    }
}
