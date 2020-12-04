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
    let scientificName: String
    let genus: String
    let family: String
    let scientificFamily: String
    let yearDiscovered: Int
}


extension Plant: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "common_name"
        case imageURL = "image_url"
        case scientificName = "scientific_name"
        case scientificFamily = "family"
        case genus = "genus"
        case family = "family_common_name"
        case yearDiscovered = "year"
    }
}
