//
//  DashboardViewModel.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI
import Combine

class DashboardViewModel: ObservableObject, Identifiable {
    @Published var blocks = [
        Block(id: "1", blockType: BlockType.completed, count: 0),
        Block(id: "2", blockType: BlockType.tasks, count: 0),
        Block(id: "3", blockType: BlockType.high, count: 0),
        Block(id: "4", blockType: BlockType.medium, count: 0)
    ]
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    @Published var error: String = ""
    
    var interactor: DashboardBusinessLogic!

    func load() {
        self.interactor.load()
    }
}
