//
//  RectangleView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/11/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct RectangleView: View {
    var text: String
    var topBottomPadding: CGFloat = 5
    var leadingTrailingPadding: CGFloat = 15
    var background: Color = .metallicSeaweed
    
    var body: some View {
        VStack {
            Text(text)
                .padding(.leading, leadingTrailingPadding)
                .padding(.trailing, leadingTrailingPadding)
                .padding(.top, topBottomPadding)
                .padding(.bottom, topBottomPadding)
                .foregroundColor(.white)
                .background(background)
                .cornerRadius(20)
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(text: "Create Task")
    }
}
