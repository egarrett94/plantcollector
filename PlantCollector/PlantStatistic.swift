//
//  PlantStatistic.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/4/20.
//

import SwiftUI

struct PlantStatistic: View {
    var statName: String
    var statValue: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(statName).font(.system(size: 20)).fontWeight(.bold).padding(.leading, 15).multilineTextAlignment(.leading).frame(alignment: .leading)
                    .lineLimit(3).foregroundColor(ColorManager.primaryFont)
            }.frame(maxWidth: 125)
            
            Text(": ").font(.system(size: 30)).foregroundColor(ColorManager.primaryFont)
            
            Text(statValue).font(.system(size: 15)).fontWeight(.light).padding(.trailing, 15).multilineTextAlignment(.leading)
                .lineLimit(3).foregroundColor(ColorManager.secondaryFont)
            Spacer()
        }.padding(.all, 5).frame(height: 60)
    }
}

struct PlantStatistic_Previews: PreviewProvider {
    static var previews: some View {
        PlantStatistic(statName: "Genus Genus Genus Genus", statValue: "Quercus Quercus Quercus Quercus")
    }
}
