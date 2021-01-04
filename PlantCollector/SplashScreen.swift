//
//  SplashScreen.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/29/20.
//

import SwiftUI


struct SplashScreen: View {
    
    @State var isActive: Bool = true
    
    var body: some View {
        VStack {
            if self.isActive {
                Spacer()
                Image(systemName: "leaf").font(.system(size: 80.0, weight: .bold)).foregroundColor(.white)
                Text("plants")
                    .font(Font.largeTitle).foregroundColor(.white).bold().padding(.top, 30)
                Spacer()
            } else {
                Welcome()
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(ColorManager.background)
        .edgesIgnoringSafeArea(.all)
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = false
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
