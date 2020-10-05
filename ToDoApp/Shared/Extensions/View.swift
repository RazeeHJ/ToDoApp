//
//  View.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/11/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
