//
//  SandboxModelFactory.swift
//  sandbox-productsTests
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation
import XCTest
@testable import sandbox_products

class SandboxModelFactory {
    
    let bundle: Bundle
    let fileName = "sandbox"
    
    init(_ bundle: Bundle) {
        self.bundle = bundle
    }
    
    func getExpectationData() -> Sandbox? {
        
        if let filePath = self.bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: filePath)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Sandbox.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
