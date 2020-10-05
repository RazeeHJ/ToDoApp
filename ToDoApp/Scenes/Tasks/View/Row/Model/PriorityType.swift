//
//  Priority.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/9/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

enum PriorityType: String, Codable, Hashable {
    case high = "High Priority"
    case medium = "Medium Priority"
    case low = "Low Priority"
    case none = ""
    
    var color: Color {
        switch self {
        case .high:
            return .redVioletCrayola
        case .medium:
            return .celticBlue
        case .low:
            return .blueCrayola
        case .none:
            return .eagleGreen
        }
    }
}

