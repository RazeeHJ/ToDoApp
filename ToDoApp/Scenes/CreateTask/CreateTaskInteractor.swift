//
//  CreateTaskInteractor.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/10/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

protocol CreateTaskBusinessLogic {
    func create(with model: ShowCreateTask.Create.Request)
}

class CreateTaskInteractor: CreateTaskBusinessLogic {
    var presenter: CreateTaskPresentationLogic
    var worker: FirestoreProtocol

    init(presenter: CreateTaskPresentationLogic, worker: FirestoreProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func create(with model: ShowCreateTask.Create.Request) {
        self.worker.create(data: model.task, collection: .task) { (result) in
            switch result {
            case .success(let task):
                let response = ShowCreateTask.Create.Request(task)
                self.presenter.present(response: response)
            case .failure(let error):
                let response = ShowCreateTask.Create.Request(error: error)
                self.presenter.present(response: response)
            }
        }
    }
}
