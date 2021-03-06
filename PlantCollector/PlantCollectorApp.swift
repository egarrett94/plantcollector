//
//  PlantCollectorApp.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import SwiftUI

@main
struct PlantCollectorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(ColorManager.background).ignoresSafeArea(.all)
        }
    }
}
