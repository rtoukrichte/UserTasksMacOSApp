//
//  TaskModel.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import Foundation

struct TaskModel: Codable, Hashable, Identifiable {
    
    let id: Int?
    let userId: Int?
    let title: String?
    let status: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case status = "completed"
    }

}
