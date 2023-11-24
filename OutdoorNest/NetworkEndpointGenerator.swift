//
//  Interface.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 11/27/23.
//

import Foundation


extension URL {
    
    static let baseURL = URL(string:"https://developer.nps.gov/api/v1/")!
    
    static let getParks = baseURL.appending(path: "parks")
    static let getActivities = baseURL.appending(path: "Activities")
    static let getAlerts = baseURL.appending(path: "Alerts")
    static let getAmenities = baseURL.appending(path: "Amenities")
    static let getConfiguration = baseURL.appending(path: "configuration")

    func withKey() {
        var urlComponents = URLComponents(string: "https://example.com/api/endpoint") // Initialize URLComponents with your base URL

        let queryItem = URLQueryItem(name: "api_key", value: APIKEY) // Create a URLQueryItem with the parameter and its value

        // If the URL already has query parameters, append the new query item
        if var queryItems = urlComponents?.queryItems {
            queryItems.append(queryItem)
            urlComponents?.queryItems = queryItems
        } else {
            // If the URL doesn't have query parameters yet, set the queryItems property with the new query item
            urlComponents?.queryItems = [queryItem]
        }

        // Now, get the finalized URL from the updated URLComponents
        if let finalURL = urlComponents?.url {
            // Use the 'finalURL' for your network request
            print(finalURL)
        }

    }
    
}


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
        var urlComponents = URLComponents(string: KeyData.baseUrl)
        
        urlComponents?.queryItems = [keyQueryItem]
        urlComponents?.path = endType.rawValue
        return urlComponents?.url
    }
}




