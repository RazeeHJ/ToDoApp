//
//  BlockType.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

enum BlockType: String, Codable, Hashable {
    case completed = "Completed"
    case tasks = "Tasks"
    case high = "High Priority"
    case medium = "Medium Priority"
    
    
    var icon: String {
        switch self {
        case .completed:
            return "bookmark.fill"
        case .tasks:
            return "hand.thumbsup.fill"
        case .high:
            return "star.fill"
        case .medium:
            return "pencil.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .completed:
            return .redVioletCrayola
        case .tasks:
            return .celticBlue
        case .high:
            return .blueCrayola
        case .medium:
            return .eagleGreen
        }
    }
}
