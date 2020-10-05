//
//  CircleView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/10/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    var image: Image = Image(systemName: "plus")
    var width: CGFloat = 60
    var height: CGFloat = 60
    var background: Color = .metallicSeaweed

    var body: some View {
        VStack {
            Circle()
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(background)
                .overlay(image.foregroundColor(.white))
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        return CircleView(image: Image(systemName: "plus"))
    }
}
