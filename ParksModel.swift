//
//  ParksModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/28/23.
//


import Foundation

// MARK: - Parks
struct ParksResponse: Codable {
    let ID: UUID?
    let total: String?
    let limit: String?
    let start: String?
    let data: [Park]?
}

// MARK: - Park
struct Park: Codable, Identifiable {
    
    let id: String
    let url: String?
    let fullName: String
    let parkCode: String?
    let description: String
    let latitude: String?
    let longitude: String?
    let latLong: String?
    let activities: [Activity]?
    let topics: [Topic]?
    let states: String?
    let contacts: Contacts?
    let entranceFees: [Entrance]?
    let entrancePasses: [Entrance]?
    let fees: [Fees]?
    let directionsInfo: String?
    let directionsURL: String?
    let operatingHours: [OperatingHour]?
    let addresses: [Address]?
    let images: [ParkImages]?
    let weatherInfo: String?
    let name:String
    let designation: String?
    let relevanceScore: Int

    enum CodingKeys: String, CodingKey {
        case id, url, fullName, parkCode, description, latitude, longitude, latLong, activities, topics, states, contacts, entranceFees, entrancePasses, fees, directionsInfo
        case directionsURL = "directionsUrl"
        case operatingHours, addresses, images, weatherInfo, name, designation, relevanceScore
    }
}



// MARK: - Address
struct Address: Codable {
    let postalCode: String?
    let city: String?
    let stateCode: String?
    let countryCode: CountryCode?
    let provinceTerritoryCode: String?
    let line1: String?
    let type: AddressType?
}

enum CountryCode: String, Codable {
    case us = "US"
}

enum AddressType: String, Codable {
    case mailing = "Mailing"
    case physical = "Physical"
}

// MARK: - Contacts
struct Contacts: Codable {
    let phoneNumbers: [PhoneNumber]
    let emailAddresses: [EmailAddress]
}

// MARK: - EmailAddress
struct EmailAddress: Codable {
    let description, emailAddress: String
}

// MARK: - PhoneNumber
struct PhoneNumber: Codable {
    let phoneNumber: String
    let description: String
    let phoneNumberExtension: String
    let type: PhoneNumberType

    enum CodingKeys: String, CodingKey {
        case phoneNumber, description
        case phoneNumberExtension = "extension"
        case type
    }
}

enum PhoneNumberType: String, Codable {
    case fax = "Fax"
    case tty = "TTY"
    case voice = "Voice"
}

// MARK: - Entrance
struct Entrance: Codable {
    let cost: String
    let description: String
    let title: String
}

// MARK: - Image
struct ParkImages: Codable {
    let credit: String
    let title: String
    let altText: String
    let caption: String
    let url: String
}

// MARK: - OperatingHour
struct OperatingHour: Codable {
    let exceptions: [Exception]
    let description: String
    let standardHours: Hours
    let name: String
}

// MARK: - Exception
struct Exception: Codable {
    let exceptionHours: Hours
    let startDate, name, endDate: String
}

// MARK: - Hours
struct Hours: Codable {
    let wednesday, monday, thursday, sunday: String?
    let tuesday, friday, saturday: String?
}

