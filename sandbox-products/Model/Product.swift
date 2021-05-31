//
//  Product.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

struct Product: Decodable, Equatable {
    let name: String
    let imageURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL
        case description
    }
}
