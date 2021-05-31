//
//  EndPoint.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

struct EndPoint {
    
    private static let BaseUrl = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/"
    
    private struct Sandbox {
        fileprivate static let products = "sandbox/products"
    }

    static let SandboxProducts = BaseUrl + Sandbox.products
    
}
