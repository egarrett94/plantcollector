//
//  PlantListItem.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import SwiftUI

struct PlantListItem: View {
    var plant: Plant;
    
    var body: some View {
        HStack {
            RemoteImage(url: plant.imageURL)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
            Text(plant.name).font(.system(size: 20))
        }
    }
}

struct PlantListItem_Previews: PreviewProvider {
    static var previews: some View {
        let remoteUrl = "https://bs.floristic.org/image/o/1a03948baf0300da25558c2448f086d39b41ca30"
        
        PlantListItem(plant: Plant(id: 1,
                                   name: "Evergreen oak",
                                   imageURL: remoteUrl,
                                   scientificName: "Quercus rotundifolia",
                                   genus: "Quercus",
                                   family: "Beech family",
                                   scientificFamily: "Fagaceae",
                                   yearDiscovered: 1785)
        )
    }
}
