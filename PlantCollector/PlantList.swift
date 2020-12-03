//
//  PlantList.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import SwiftUI

struct PlantList: View {
    var plants: [Plant];
    
    var body: some View {
        NavigationView {
            List(plants) {
                plant in
                PlantListItem(plant: plant).frame(height: 60)
            }.navigationBarTitle(Text("Plants"))
        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList(plants: [Plant(id: 1, name: "monstera", image: "leaf"),
                           Plant(id: 2, name: "fiddle leaf fig", image: "leaf"),
                           Plant(id: 3, name: "majesty palm", image: "leaf")])
    }
}
