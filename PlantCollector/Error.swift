//
//  ErrorView.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/9/20.
//

import SwiftUI

struct ErrorView: View {
    var error: Error
    var retryHandler: Any
    
    var body: some View {
        Text("error occurred")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "error" as! Error, retryHandler: "retryhandler")
    }
}
