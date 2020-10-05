//
//  Tasks.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: TasksViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                List {
                    if !viewModel.tasks.isEmpty {
                        Text("To Do Tasks")
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                            .foregroundColor(.eagleGreen)
                        
                        ForEach(viewModel.tasks) { task in
                            if !task.completed {
                                Button(action: {
                                    self.viewModel.update(with: task)
                                }) {
                                    TaskRow(task: task)
                                }
                            }
                        }
                        
                        Divider()
                        
                        Text("Completed Tasks")
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                            .foregroundColor(.eagleGreen)
                        
                        ForEach(viewModel.tasks) { task in
                            if task.completed {
                                Button(action: {
                                    self.viewModel.update(with: task)
                                }) {
                                    TaskRow(task: task)
                                }
                            }
                        }
                    }
                }
                .alert(isPresented: self.$viewModel.isError, content: {
                    Alert(title: Text("Alert, \(self.viewModel.error ?? "Sth Went Wrong!")"),
                          message: Text("Try Again?"),
                          primaryButton: Alert.Button.default(Text("Yes"),
                                                              action: {
                                                                self.viewModel.fetch()
                                                                self.viewModel.isLoading.toggle()
                          }),
                          secondaryButton: Alert.Button.default(Text("Cancel"),
                                                                action: {
                          }))
                    
                })
                ActivityIndicator(isAnimate: self.$viewModel.isLoading)

            }.onAppear {
                self.viewModel.fetch()
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TasksViewModel()
        return TasksView(viewModel: viewModel)
    }
}
