//
//  TopicModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/29/23.
//

import Foundation


// MARK: - Topics
struct Topics: Codable {
    let total, limit, start: String
    let data: [Topic]
}

// MARK: - Topic
struct Topic: Codable {
    let id, name: String
}
