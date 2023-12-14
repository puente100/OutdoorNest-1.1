//
//  ActivitiesModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/26/23.
//

import Foundation

// MARK: - Activities
struct Activities: Codable {
    let total: String?
    let limit: String?
    let start: String?
    let data: [Activity]?
}

// MARK: - Activity
struct Activity: Codable {
    let id, name: String
}


