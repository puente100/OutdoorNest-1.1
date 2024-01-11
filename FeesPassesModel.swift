//
//  FeesPassesModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/29/23.
//

import Foundation


// MARK: - Fees
struct Fees: Codable {
    let total: String
    let limit: String
    let start: String
    let data: [FeePass]
}

// MARK: - FeePass
struct FeePass: Codable {
    let parkCode: String
    let isFeeFreePark: Bool
    let isInteragencyPassAccepted: Bool
    let cashless: Cashless
    let feesAtWorkURL: String
    let entranceFeeDescription, entrancePassDescription: String
    let isParkingFeePossible: Bool
    let parkingDetailsURL: String
    let fees: [Fee]
    let passes: [Pass]

    enum CodingKeys: String, CodingKey {
        case parkCode, isFeeFreePark, isInteragencyPassAccepted, cashless
        case feesAtWorkURL = "feesAtWorkUrl"
        case entranceFeeDescription, entrancePassDescription, isParkingFeePossible
        case parkingDetailsURL = "parkingDetailsUrl"
        case fees, passes
    }
}

enum Cashless: String, Codable {
    case dependsOnLocation = "Depends on Location"
    case empty = ""
    case no = "No"
    case yes = "Yes"
}

// MARK: - Fee
struct Fee: Codable {
    let entranceFeeType: String
    let startDate: EndDateClass
    let paymentDescription: String
    let recGovPurchaseURL: String
    let timedEntryLocation: TimedEntryLocation
    let endDate: EndDateClass
    let exceptions, payGovPurchaseURL, cost: String
    let timedEntryShortDescription: TimedEntryShortDescription
    let description: String
    let informationURL: String
    let id: String
    let npsGovPurchaseURL: String

    enum CodingKeys: String, CodingKey {
        case entranceFeeType, startDate, paymentDescription
        case recGovPurchaseURL = "recGovPurchaseUrl"
        case timedEntryLocation, endDate, exceptions
        case payGovPurchaseURL = "payGovPurchaseUrl"
        case cost, timedEntryShortDescription, description
        case informationURL = "informationUrl"
        case id
        case npsGovPurchaseURL = "npsGovPurchaseUrl"
    }
}

// MARK: - EndDateClass
struct EndDateClass: Codable {
    let month: Int
    let holiday: String?
    let day: Int
}

enum TimedEntryLocation: String, Codable {
    case cadillacSummitRoadVehicleReservations = "Cadillac Summit Road Vehicle Reservations"
    case empty = ""
}

enum TimedEntryShortDescription: String, Codable {
    case empty = ""
    case requiredToDriveCadillacSummitRoad = "Required to drive Cadillac Summit Road"
    case requiredToEnterThePark = "Required to enter the park"
}

// MARK: - Pass
struct Pass: Codable {
    let exceptions: String
    let payGovPurchaseURL: String
    let cost: String
    let image: [PassImage]
    let description: String
    let paymentDescription: String
    let category: String
    let informationURL: String
    let recGovPurchaseURL: String
    let id: String
    let npsGovPurchaseURL: String

    enum CodingKeys: String, CodingKey {
        case exceptions
        case payGovPurchaseURL = "payGovPurchaseUrl"
        case cost, image, description, paymentDescription, category
        case informationURL = "informationUrl"
        case recGovPurchaseURL = "recGovPurchaseUrl"
        case id
        case npsGovPurchaseURL = "npsGovPurchaseUrl"
    }
}

// MARK: - PassImage
struct PassImage: Codable {
    let credit: String
    let title: String
    let altText: String
    let caption: String
    let url: String
}


