//
//  AppError.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/24/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import Foundation

enum AppError: Error, Decodable {
    init(from decoder: Decoder) throws {
        self = .runtimeError()
    }
    
    case networkError(String = "Failed to perfom request")
    case runtimeError(String = "Oops, Something went wrong")
    
    var message: String {
        switch self {
        case .networkError(let message),
             .runtimeError(let message):
            return message
        }
    }
}
