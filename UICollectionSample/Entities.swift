//
//  Entities.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/07/21.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import Foundation

struct Question : Codable, Hashable {
    let title : String
    let descriptionText : String?
    let questionType : QuestionType
    let required : Bool?
    let order: Int
    let options : Option?
    
    enum CodingKeys: String, CodingKey {
        case descriptionText = "description"
        case options
        case required
        case title
        case questionType = "type"
        case order
    }
    
    enum QuestionType: String, Codable, CaseIterable {
        case singleSelection = "single_selection"
        case multiSelection = "multi_selection"
        case text
    }
    
    struct Option : Codable, Hashable {
        let selections : [Selection]?
        
        struct Selection : Codable, Hashable {
            let title : String?
            let descriptionText : String?
            let order: Int
            
            enum CodingKeys: String, CodingKey {
                case descriptionText = "description"
                case title
                case order
            }
            
            func hash(into hasher: inout Hasher) {
                hasher.combine(UUID())
            }
        }
    }
}
