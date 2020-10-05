//
//  LoginView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            self.googleButton
        }
    }
    
    private var googleButton: some View {
        ZStack(alignment: .leading) {
            Button(action: {
                self.viewModel.login()
            }) {
                HStack {
                    Image("GoogleLogo")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .leading)
                        .padding(3)
                        .cornerRadius(4)
                        .shadow(radius: 5)
                    
                    Text("Sign In With Google")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .bold()
                    Spacer()
                }
            }
            .frame(width: 300, height: 50, alignment: .center)
            .background(Color.blue)
            .cornerRadius(4)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
        return LoginView(viewModel: viewModel)
    }
}
