//
//  Summary.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/22/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//


import Foundation
import FirebaseFirestoreSwift

struct Block: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var blockType: BlockType?
    var count: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case blockType
        case count
    }
}
