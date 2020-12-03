//
//  PlantList.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import SwiftUI
import Alamofire


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
        Group {
            PlantList(plants: [Plant(id: 1, name: "monstera", imageURL: "leaf"),
                               Plant(id: 2, name: "fiddle leaf fig", imageURL: "leaf"),
                           Plant(id: 3, name: "majesty palm", imageURL: "leaf")])
            PlantList(plants: [Plant(id: 1, name: "monstera", imageURL: "leaf"),
                               Plant(id: 2, name: "fiddle leaf fig", imageURL: "leaf"),
                               Plant(id: 3, name: "majesty palm", imageURL: "leaf")])
        }
    }
}
