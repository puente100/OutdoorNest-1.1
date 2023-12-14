//
//  NetworkEndpointGenerator.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/27/23.
//

import Foundation

enum KeyData {
    static let ApiKey = "vU5Zy7EXQT5dAeB4nmnAQvVKud6gAjg9dEn3DUP3"
    static let baseUrl = "https://developer.nps.gov/api/v1/"
}


struct NetworkEndpointGenerator {
    enum EndType: String {
        case parks = "parks"
        case activities =  "Aactivities"
        case alerts =  "alerts"
        case amenities =  "amenities"
        case configuration =  "configuration"
    }
    
    private let keyQueryItem = URLQueryItem(name: "api_key", value: KeyData.ApiKey)
    
    func getURL(for endType: EndType) -> URL? {
        var urlComponents = URLComponents(string: KeyData.baseUrl + endType.rawValue)
        urlComponents?.queryItems = [keyQueryItem]
        return urlComponents?.url
    }
}




