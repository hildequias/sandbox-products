//
//  Cash.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

struct Cash: Decodable {
    let title: String
    let bannerURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case bannerURL
        case description
    }
}
