//
//  TaskInteractor.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

protocol TasksBusinessLogic {
    func load()
    func update(with request: ShowTasks.Create.Request)
}

class TasksInteractor: TasksBusinessLogic {
    var worker: FirestoreProtocol
    var presenter: TasksPresentationLogic
    var mapper: TasksMapperDisplayLogic

    var tasks: [Task] = []

    init(worker: FirestoreProtocol, presenter: TasksPresentationLogic, mapper: TasksMapperDisplayLogic) {
        self.worker = worker
        self.presenter = presenter
        self.mapper =  mapper
    }
    
    func load()  {
        self.worker.fetch(collection: .task) { (result) in
            switch result {
            case .success(let documents):
                documents.forEach { (document) in
                    let mapper = self.mapper.mapToDisplayLogic(from: document, id: document.documentID)
                    self.tasks.append(mapper.model!)
                }
                let response = ShowTasks.Get.Response(self.tasks)
                self.presenter.present(response: response)
            case .failure(let message):
                let response = ShowTasks.Get.Response(error: "\(message)")
                self.presenter.present(response: response)
            }
        }
    }
    
    func update(with request: ShowTasks.Create.Request) {
        self.worker.update(with: request.task!.id!, field: "completed", value: !request.task!.completed, collection: .task) { (result) in
            switch result {
            case .success:
                guard let index = self.tasks.firstIndex(of: request.task!) else {return}
                self.tasks[index].completed = !self.tasks[index].completed

                let response = ShowTasks.Get.Response(self.tasks)
                self.presenter.present(response: response)
            case .failure(let message):
                let response = ShowTasks.Get.Response(error: message.localizedDescription)
                self.presenter.present(response: response)
            }
        }
    }
}
