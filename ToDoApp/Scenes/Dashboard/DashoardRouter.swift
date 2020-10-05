//
//  DashoardPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

class DashboardRouter {
    func router() -> some View {
        let viewModel = DashboardViewModel()
        let worker = FirestoreWorker()
        let presenter =  DashboardPresenter(viewModel: viewModel)
        let interactor = DashboardInteractor(worker: worker, presenter: presenter)
        viewModel.interactor = interactor
        return DashboardView(viewModel: viewModel)
    }
}
