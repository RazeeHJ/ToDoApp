//
//  DashboardBlockView.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import SwiftUI

struct DashboardBlockView: View {
    var block: Block
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            Image(systemName: block.blockType!.icon)
                .foregroundColor(.white)
            
            Spacer()
            Spacer()
            Spacer()

            VStack(alignment: .leading) {
                Text("\(block.count!)")
                    .font(.system(size: 35.0))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()

                Text("\(block.blockType!.rawValue)")
                    .font(.system(size: 18.0))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .padding(20.0)
        .frame(width: 150, height: 200, alignment: .center)
        .background(block.blockType!.color)
        .cornerRadius(10)
    }
}

struct DashboardBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let block = Block(id: "1", blockType: .high, count: 5)
        
        return DashboardBlockView(block: block)
    }
}
