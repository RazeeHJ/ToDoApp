//
//  DIRouter.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

final class ContentRouter {
    func router() -> some View {
        let viewModel = LoginViewModel()
        let view = ContentView().environmentObject(viewModel)
        return view
    }
}
