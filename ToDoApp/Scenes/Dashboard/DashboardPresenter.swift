//
//  DashboardPresenter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI

protocol DashboardPresentationLogic {
    func present(response: ShowDashboard.Get.Response)
}

class DashboardPresenter: DashboardPresentationLogic {
    @ObservedObject var viewModel: DashboardViewModel

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    func present(response: ShowDashboard.Get.Response) {
        if let error = response.error {
            self.viewModel.isError = true
            self.viewModel.isLoading = false
            self.viewModel.error = error
        } else {
            self.viewModel.isLoading = !self.viewModel.isLoading
            self.viewModel.blocks = response.blocks!
        }
    }
}
