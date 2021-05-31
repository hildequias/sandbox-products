//
//  ProductService.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

protocol ProductServiceDelegate: AnyObject {
    func getSandboxResult(_ sandbox: Sandbox)
}

class ProductService: HttpService {
    
    // MARK: - Properies
    weak var delegate: ProductServiceDelegate?
    
    // MARK: - Method
    func getSandbox() {
        self.doGet(url: EndPoint.SandboxProducts).responseDecodable(of: Sandbox.self) { (response) in
            guard let sandbox = response.value else { return }
            debugPrint(sandbox)
            self.delegate?.getSandboxResult(sandbox)
        }
    }
}
