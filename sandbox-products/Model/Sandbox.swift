//
//  Sandbox.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

struct Sandbox : Decodable {

    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
    
    enum CodingKeys: String, CodingKey {
        case spotlight
        case products
        case cash
    }
}
