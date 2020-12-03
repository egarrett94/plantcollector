//
//  Plant.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import Foundation

struct Plant: Identifiable {
    let id: Int
    let name: String
    let imageURL: String
}


extension Plant: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "common_name"
        case imageURL = "image_url"
    }
}
