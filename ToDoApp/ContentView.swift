//
//  ContentView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var showTasksView = true
    @State private var showCreateTaskView = false
    @State private var showDashboardView = false

    @State var showView = Tab.tasks
    
    let loginRouter = LoginRouter()
    let tasksRouter = TasksRouter()
    let createTaskRouter = CreateTaskRouter()
    let dashboardRouter = DashboardRouter()
    
    var body: some View {
        ZStack {
            if self.viewModel.isLoggedIn {
                loggedIn
            } else {
                self.loginRouter.router(viewModel).shadow(radius: 10)
            }
        }
    }
    
    var loggedIn: some View {
        VStack {
            Spacer()
            
            if showView == .tasks {
                if self.showTasksView {
                    tasksRouter.router()
                }
            }
            
            else if showView == .dashboard {
                dashboardRouter.router()
            }
            
            ZStack(alignment: .top) {
                BottomBar(selected: $showView)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(TabBarShape())
                
                Button(action: {
                    self.showCreateTaskView = true
                    self.showTasksView = false
                }, label: {
                    CircleView().shadow(radius: 10)
                })
                    .offset(y: -25)
                    .sheet(isPresented: self.$showCreateTaskView, onDismiss: {
                        print("Code executed when the sheet dismisses")
                        self.showTasksView = true
                    })  {
                        self.createTaskRouter.router()
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct TabBarShape : View {
    var body : some View{
        
        Path { path in
            path.move(to: CGPoint(x: 0, y: -70))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: -70))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 35))
            path.addLine(to: CGPoint(x: 0, y: 35))
            
        }
        .fill(Color.darkGrey)
        .rotationEffect(.init(degrees: 180))
    }
}

struct BottomBar : View {
    @Binding var selected: Tab
    
    var body : some View{
        HStack{
            Button(action: {
                self.selected = Tab.tasks
            }) {
                Image(systemName: "house.fill")
            }.foregroundColor(self.selected == Tab.tasks ? .metallicSeaweed : .white)
                .offset(y: 10)
            
            Spacer(minLength: 12)
            
            Spacer().frame(width: 144)
            
            Spacer(minLength: 12)
            
            Button(action: {
                self.selected = Tab.dashboard
            }) {
                Image(systemName:"person.fill")
            }.foregroundColor(self.selected == Tab.dashboard ? .metallicSeaweed : .white)
                .offset(y: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
        viewModel.isLoggedIn = false
        return ContentView().environmentObject(viewModel)
    }
}

