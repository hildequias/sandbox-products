//
//  spotlight.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

struct Spotlight: Decodable {
    let name: String
    let bannerURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case bannerURL
        case description
    }
}
