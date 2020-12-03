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
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(plant.name)
        }
    }
}

struct PlantListItem_Previews: PreviewProvider {
    static var previews: some View {
        PlantListItem(plant: Plant(id: 1, name: "Monstera", imageURL: "leaf"))
    }
}
