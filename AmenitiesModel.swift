//
//  AmenitiesModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/28/23.
//

import Foundation


// MARK: - Amenities
struct Amenities: Codable {
    let total: String?
    let limit: String?
    let start: String?
    let data: [Amenity]
}

// MARK: - Amenity
struct Amenity: Codable {
    let id: String?
    let name: String?
    let categories: [String]?
}

