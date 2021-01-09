//
//  MainEntity.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import Foundation

struct ResponseModel: Decodable {
    let status: String
    let result: Result
}

extension ResponseModel {
    struct Result: Decodable {
        let title: String
        let actionTitle: String
        let selectedActionTitle: String
        let list: [List]
    }
    
    struct List: Decodable {
        let id: String
        let title: String
        let description: String?
        let icon: [String: String]
        let price: String
        let isSelected: Bool
    }
}


