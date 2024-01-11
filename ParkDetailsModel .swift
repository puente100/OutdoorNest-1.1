//
//  ParkDetailsModel .swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/10/24.
//

import Foundation

protocol ParkDetailsData {
    var type: ParkDetailsCellType { set get }
    var id: String { set get }
}

enum ParkDetailsCellType: String {
    case heroImage
    case description
    case activities
}

struct ParkDetailsImage: ParkDetailsData {
    var id: String = ParkDetailsCellType.heroImage.rawValue
    var type: ParkDetailsCellType = .heroImage
    let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
}

struct ParkDetailsDescription: ParkDetailsData {
    var id: String = ParkDetailsCellType.description.rawValue
    var type: ParkDetailsCellType = .description
    let description: String
    
    init(description: String) {
        self.description = description
    }
}

struct ParkDetailsActivities: ParkDetailsData {
    var id: String = ParkDetailsCellType.activities.rawValue
    var type: ParkDetailsCellType = .activities
    let acitivities: [String]

    init(acitivities: [String]) {
        self.acitivities = acitivities
    }
}

