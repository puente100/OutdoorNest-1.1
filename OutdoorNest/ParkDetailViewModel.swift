//
//  ParkDetailViewModel.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/11/24.
//
//
//import Foundation
//
//static func generateListData(with park: Park? = nil) -> [ParkDetailsData] {
//    var parkDetailsData = [ParkDetailsData]()
//    
//    guard let park else { return parkDetailsData}
//    
//    if let imageUrl = park.images?.first?.url {
//        let heroImageData = ParkDetailsImage(imageUrl: imageUrl)
//        parkDetailsData.append(heroImageData)
//    }
//    
//    let descriptionData = ParkDetailsDescription(description: park.description)
//    parkDetailsData.append(descriptionData)
//        
//    if let activities = park.activities {
//        let activitiesData = ParkDetailsActivities(acitivities: activities.compactMap { $0.name })
//        parkDetailsData.append(activitiesData)
//    }
//    
//    return parkDetailsData
//}
