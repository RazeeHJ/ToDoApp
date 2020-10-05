//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
      
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack(spacing: 5){
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(self.task.priorityType?.rawValue ?? "")")
                        .foregroundColor(.white)
                        .font(.system(size: 12.0))
                        .fontWeight(.bold)
                    Text("\(self.task.name ?? "")")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("\(self.task.description ?? "")")
                        .foregroundColor(.white)
                        .font(.system(size: 14.0))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Image(systemName: self.task.completed ? "checkmark.circle.fill" : "circle")
                        .imageScale(.large)
                }
            }
        }
        .padding()
        .background(self.task.priorityType?.color)
        .cornerRadius(10)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        let task = Task(name: "Task 1", description: "This is description", date: Date(), priorityType: .high, completed: false)
        return TaskRow(task: task)
    }
}
