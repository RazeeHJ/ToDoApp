//
//  DashoardInteractor.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DashboardBusinessLogic {
    func load()
}

class DashboardInteractor: DashboardBusinessLogic {
    var worker: FirestoreProtocol
    var presenter: DashboardPresentationLogic

    var blocks: [Block] = [Block(id: "1", blockType: .completed, count: 0), Block(id: "2",blockType: .tasks, count: 0), Block(id: "3", blockType: .high, count: 0), Block(id: "4", blockType: .medium, count: 0)]

    init(worker: FirestoreProtocol, presenter: DashboardPresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }

    func load()  {
        self.worker.fetch(collection: .task) { (result) in
            switch result {
            case .success(let documents):
                documents.forEach { (document) in
                    self.mapper(document)
                }

                let response = ShowDashboard.Get.Response(self.blocks)
                self.presenter.present(response: response)
            case .failure(let message):
                let response = ShowDashboard.Get.Response(error: "\(message)")
                self.presenter.present(response: response)
            }
        }
    }
    
    func mapper(_ document: QueryDocumentSnapshot) {
        if (document["completed"] as? Bool == true) {
            self.blocks[0].count = self.blocks[0].count! + 1
        } else if (document["completed"] as? Bool == false) {
            self.blocks[1].count = self.blocks[1].count! + 1
        }
        if (document["priorityType"] as? String == Optional("High Priority"))  {
            self.blocks[2].count = self.blocks[2].count! + 1
        } else if (document["priorityType"] as? String == Optional("Medium Priority")) {
            self.blocks[3].count = self.blocks[3].count! + 1
        }
    }
}
