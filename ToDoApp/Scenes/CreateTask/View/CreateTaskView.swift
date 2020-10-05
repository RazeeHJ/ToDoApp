//
//  CreateTaskView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: CreateTaskViewModel

    @State var name: String = ""
    @State var date: Date = Date()
    @State var description: String = ""
    @State var priority: PriorityType = .none
    @State var showDatePicker: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                topView
                Spacer().frame(height: 10)
                descriptionView
                priorityView
                Spacer()
                createButtonView.padding(40)
            }
            datePickerView
        }
        .onAppear {
            print("CreateTaskView on appear")
        }
        .onDisappear(perform: {
            print("CreateTaskView on disappear")
        })
        .background(Color.darkGrey)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var topView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Group {
                Spacer()
                    .frame(height: 40)
                
                Text("Create new task")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name")
                        .foregroundColor(.white)
                        .bold()
                    
                    TextField("Name of task", text: $name)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Divider().background(Color.white)
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Date")
                            .foregroundColor(.white)
                            .bold()
                        Text("\(date, formatter: dateFormatter)")
                            .foregroundColor(.white)
                        Divider().foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.showDatePicker = true
                    }, label: {
                        CircleView(image: Image(systemName: "timer"), width: 50, height: 50, background: Color.metallicSeaweed)
                            .shadow(radius: 10)
                    })
                }
            }
        }
        .padding(20)
        .background(Color.eagleGreen)
        .cornerRadius(20, corners: [.bottomRight, .bottomLeft])
    }
    
    private var descriptionView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Description")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    MultiLineTextField(text: $description)
                        .cornerRadius(10)
                        .shadow(radius: 40)
                    Divider().background(Color.white)
                }.padding(.leading, 20)
                    .padding(.trailing, 20)
            }
        }
    }
    
    private var priorityView: some View {
        HStack(alignment: .center, spacing: 20) {
            Button(action: {
                self.priority = .high
            }) {
                RectangleView(text: "High", background: self.priority == .high ? Color.redVioletCrayola : Color.metallicSeaweed)
            }
            
            Button(action: {
                self.priority = .medium
            }) {
                RectangleView(text: "Medium", background: self.priority == .medium ? Color.celticBlue : Color.metallicSeaweed)
            }
            
            Button(action: {
                self.priority = .low
            }) {
                RectangleView(text: "Low", background: self.priority == .low ? Color.blueCrayola : Color.metallicSeaweed)
            }
        }
    }
    
    private var createButtonView: some View {
        Button(action: {
            self.viewModel.create(with: self.handleCreateTask())
            self.presentationMode.wrappedValue.dismiss()
        }) {
            RectangleView(text: "Create Task", topBottomPadding: 12, leadingTrailingPadding: 100)
        }
    }
    
    private var datePickerView: some View {
        ZStack {
            if $showDatePicker.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        DatePicker(selection: $date, in: ...Date(), displayedComponents: .date)
                        {
                            Text("Select a date")
                        }.colorMultiply(.black)
                        
                        Button(action: {
                            self.showDatePicker = false
                        }, label: {
                            Text("Done")
                        })
                    }
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20).shadow(radius: 20)
            }
        }
    }
    
    private func handleCreateTask() -> Task {
        return Task(name: name, description: description, date: date, priorityType: priority, completed: false)
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CreateTaskViewModel()
        return CreateTaskView(viewModel: viewModel)
    }
}
