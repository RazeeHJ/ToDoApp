//
//  DashoardView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    DashboardBlockView(block: viewModel.blocks[0])
                    DashboardBlockView(block: viewModel.blocks[1])
                }
                
                HStack {
                    DashboardBlockView(block: viewModel.blocks[2])
                    DashboardBlockView(block: viewModel.blocks[3])
                }
                
                ActivityIndicator(isAnimate: $viewModel.isLoading)

            }.alert(isPresented: self.$viewModel.isError, content: {
                Alert(title: Text("Alert, \(self.viewModel.error ?? "Sth Went Wrong!")"),
                      message: Text("Try Again?"),
                      primaryButton: Alert.Button.default(Text("Yes"),
                                                          action: {
                                                            self.viewModel.load()
                                                             self.viewModel.isLoading.toggle()
                      }),
                      secondaryButton: Alert.Button.default(Text("Cancel"),
                                                            action: {
                      }))
                
            })
            
        }.onAppear {
            self.viewModel.load()
        }
    }
}

struct DashoardView_Previews: PreviewProvider {
    static var previews: some View {
        let block1 = Block(id: "1", blockType: .completed, count: 5)
        let block2 = Block(id: "2", blockType: .tasks, count: 3)
        let block3 = Block(id: "3", blockType: .high, count: 1)
        let block4 = Block(id: "4", blockType: .medium, count: 0)
        
        let viewModel = DashboardViewModel()
        viewModel.blocks[0] = block1
        viewModel.blocks[1] = block2
        viewModel.blocks[2] = block3
        viewModel.blocks[3] = block4
        viewModel.isLoading = !viewModel.isLoading


        return DashboardView(viewModel: viewModel)
    }
}

