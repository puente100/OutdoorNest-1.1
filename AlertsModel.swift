//
//  AlertsModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/28/23.
//

import Foundation

// MARK: - Alerts
struct Alerts: Codable {
    let total:  String
    let limit: String
    let start: String
    let data: [Alert]
}

// MARK: - Alert
struct Alert: Codable {
    let id: String
    let url: String
    let title, parkCode, description: String
    let category: Category
    let relatedRoadEvents: [RelatedRoadEvent]
    let lastIndexedDate: String
}

enum Category: String, Codable {
    case caution = "Caution"
    case danger = "Danger"
    case information = "Information"
    case parkClosure = "Park Closure"
}

// MARK: - RelatedRoadEvent
struct RelatedRoadEvent: Codable {
    let title: String
    let id: String
    let type: String
    let url: String
}
