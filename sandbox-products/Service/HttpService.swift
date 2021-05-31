//
//  HttpService.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit
import Alamofire

open class HttpService {
    
    // MARK: - Method GET
    func doGet(url: String) -> DataRequest {
        return AF.request(url)
    }
}
