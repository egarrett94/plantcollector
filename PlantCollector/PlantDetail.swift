//
//  PlantDetail.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/3/20.
//

import SwiftUI

struct PlantDetail: View {
    let plant: Plant;
    
    var body: some View {
        VStack {
            RemoteImage(url: plant.imageURL)
                .aspectRatio(contentMode: .fill).clipShape(Circle())
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Circle().foregroundColor(.white))
                .overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 15).padding(.bottom, 15)
            
            Text(plant.name).font(.system(size: 36)).bold().foregroundColor(ColorManager.primaryFont)
            Text(plant.family).font(.system(size: 28)).padding(.bottom).foregroundColor(ColorManager.secondaryFont)
            
            PlantStatistic(statName: "Scientific Name", statValue: plant.scientificName)
            PlantStatistic(statName: "Scientific Family", statValue: plant.scientificFamily)
            PlantStatistic(statName: "Genus", statValue: plant.genus)
            PlantStatistic(statName: "Discovered", statValue: String(plant.yearDiscovered))
            Spacer()
        }
    }
}

struct PlantDetail_Previews: PreviewProvider {
    static var previews: some View {
        let remoteUrl = "https://bs.floristic.org/image/o/1a03948baf0300da25558c2448f086d39b41ca30"
        
        PlantDetail(plant: Plant(id: 1,
                                 name: "Evergreen oak",
                                 imageURL: remoteUrl,
                                 scientificName: "Quercus rotundifolia",
                                 genus: "Quercus",
                                 family: "Beech family",
                                 scientificFamily: "Fagaceae",
                                 yearDiscovered: 1785))
    }
}
