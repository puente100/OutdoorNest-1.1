//
//  ParkDetailsView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/6/24.
//

import SwiftUI

struct ParkDetailsView: View {
   @State var parkDetailsData: [ParkDetailsData]
    
    var body: some View {
        List {
            ForEach(parkDetailsData, id: \.id) { item in
                switch item.type {
                case .heroImage:
                    if
                        let heroImageData = item as? ParkDetailsImage,
                        let url = URL(string: heroImageData.imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:300, height: 300)
                                .cornerRadius(10)
                                .shadow(radius: 30)
                        } placeholder: {
                            Image(systemName: "tree.fill")
                        }
                    }
                case .description:
                    if let descriptionData = item as? ParkDetailsDescription {
                        Text(descriptionData.description)
                    }
                         
                case .activities:
                    if let activitiesData = item as? ParkDetailsActivities {
                        VStack {
                            ForEach(activitiesData.acitivities, id: \.self) {
                                Text("\($0)")
                
                            }
                        }
                    }
                }
            }
        }
        .foregroundStyle(Color.customColor.forestGreenColor)
    }
    
    static func generateListData(with park: Park? = nil) -> [ParkDetailsData] {
        var parkDetailsData = [ParkDetailsData]()
        
        guard let park else { return parkDetailsData}
        
        if let imageUrl = park.images?.first?.url {
            let heroImageData = ParkDetailsImage(imageUrl: imageUrl)
            parkDetailsData.append(heroImageData)
        }
        
        let descriptionData = ParkDetailsDescription(description: park.description)
        parkDetailsData.append(descriptionData)
            
        if let activities = park.activities {
            let activitiesData = ParkDetailsActivities(acitivities: activities.compactMap { $0.name })
            parkDetailsData.append(activitiesData)
        }
        
        return parkDetailsData
    }
        
    
}

struct ParkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetailsView(parkDetailsData: ParkDetailsView.generateListData())
    }
}

