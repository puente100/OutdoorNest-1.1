//
//  ParkView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/4/24.
//

import SwiftUI
struct ParkView: View {
    let park: Park
    
    var body: some View {
        HStack {
            if let imageUrlString = park.images?.first?.url,
               let imageUrl = URL(string: imageUrlString) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.gray, lineWidth: 2))
                        
                    default:
                        Image(systemName: "tree.fill")
                        
                    }
                }
            } else {
                Image(systemName: "tree.fill")
                    .frame(width: 100, height: 100)

            }
            VStack {
                Text(park.name)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundStyle(Color.customColor.primaryGreenColor)
                    .frame(maxWidth: .infinity)
                if let designation = park.designation {
                    Text(designation)
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .foregroundStyle(Color.customColor.lightGreenColor)
                }
            }
            .padding()
            .background(Color.white)
        .cornerRadius(10)

        }
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        let park = Park(id: "1234567",
                        url: nil,
                        fullName: "Parque de prueba",
                        parkCode: nil,
                        description: "",
                        latitude: nil,
                        longitude: nil,
                        latLong: nil,
                        activities: nil,
                        topics: nil,
                        states: nil,
                        contacts: nil,
                        entranceFees: nil,
                        entrancePasses: nil,
                        fees: nil,
                        directionsInfo: nil,
                        directionsURL: nil,
                        operatingHours: nil,
                        addresses: nil,
                        images: nil,
                        weatherInfo: nil,
                        name: "Parque de prueba",
                        designation: "National Monument",
                        relevanceScore: 3)
        ParkView(park: park)
    }
}

