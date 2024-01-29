//
//  ParkDetailsView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/6/24.
//

import SwiftUI

struct ParkDetailsView: View {
    @State var parkDetailsData: [ParkDetailsData]
    @State private var showFullText = false
    @State private var showFullActivities = false

    var body: some View {
        List {
            ForEach(parkDetailsData, id: \.id) { item in
                switch item.type {
                    
                case .heroImage:
                        if
                            let heroImageData = item as? ParkDetailsImage,
                            let url = URL(string: heroImageData.imageUrl),
                                !heroImageData.imageUrl.isEmpty {
                            Section(header: Text("Park").textCase(.none).font(.title2)) {
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
                    }
                    
                case .description:
                    if let descriptionData = item as? ParkDetailsDescription, !descriptionData.description.isEmpty {
                        Section(header: Text("Descriptions").textCase(.none).font(.title2)) {
                            VStack {
                                Text(showFullText ? descriptionData.description.prefix(descriptionData.description.count) : descriptionData.description.prefix(100))
                                    .lineLimit(showFullText ? nil : 4)
                                    .fixedSize(horizontal: false, vertical: true)

                                if descriptionData.description.count > 100 {
                                    Button(action: {
                                        withAnimation  {
                                            showFullText.toggle()
                                        }
                                    }) {
                                        Text(showFullText ? "Read Less" : "Read More")
                                            .foregroundColor(.blue)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                            }
                            .padding()
                        }
                    }

                    
              
                case .activities:
                        if let activitiesData = item as? ParkDetailsActivities,
                           !activitiesData.acitivities.isEmpty {
                            Section(header: Text("Activities").textCase(.none).font(.title2)) {
                                VStack {
                                    ForEach(activitiesData.acitivities, id: \.self) {
                                        Text("\($0)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }
                        }
                case .entrancePasses:
                        if let entranceData = item as? ParkDetailsEntrancePasses,
                           !entranceData.entrancePasses.isEmpty {
                            Section(header: Text("Passes").textCase(.none).font(.title2)) {
                            VStack {
                                ForEach(entranceData.entrancePasses) { entrance in
                                    VStack {
                                        Text("\(entrance.title)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("\(entrance.cost) USD")
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundStyle(Color.customColor.forestGreenColor)
        
    }
    // MARK: - ParkDetailViewModel
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
        
        if let entrancePasses = park.entranceFees {
            let entrancePassesData = ParkDetailsEntrancePasses(entrancePasses: entrancePasses)
            parkDetailsData.append(entrancePassesData)
        }
        
        return parkDetailsData
    }
}

struct ParkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetailsView(parkDetailsData: ParkDetailsView.generateListData())
    }
}

