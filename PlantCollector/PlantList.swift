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
        VStack {
            NavigationView {
                List(plants) {
                    plant in
                    NavigationLink(destination: PlantDetail(plant: plant)) {
                        PlantListItem(plant: plant).frame(height: 60)
                    }
                }.navigationBarTitle(Text("Plants"))
            }
        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        let remoteUrl = "https://bs.floristic.org/image/o/8390d605e1947cb44e24af9492f96df4a34e8ca8"
        
        Group {
            PlantList(plants: [Plant(id: 1,
                                     name: "Evergreen oak",
                                     imageURL: remoteUrl,
                                     scientificName: "Quercus rotundifolia",
                                     genus: "Quercus",
                                     family: "Beech family",
                                     scientificFamily: "Fagaceae",
                                     yearDiscovered: 1785),
                               Plant(id: 2,
                                     name: "Stinging nettle",
                                     imageURL: remoteUrl,
                                     scientificName: "Urtica dioica",
                                     genus: "Urtica",
                                     family: "Nettle family",
                                     scientificFamily: "Urticaceae",
                                     yearDiscovered: 1753)
            ])
        }
    }
}
