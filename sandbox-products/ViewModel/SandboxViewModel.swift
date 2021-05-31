//
//  SandboxViewModel.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import Foundation

protocol SandboxViewModelDelegate {
    func updateData()
}

class SandboxViewModel {
    
    // MARK: - Properies
    var sandboxData: Sandbox!
    var service: ProductService
    var delegate: SandboxViewModelDelegate!
    
    init() {
        service = ProductService()
        service.delegate = self
    }
    
    // MARK: - Method
    func loadSandboxData() {
        service.getSandbox()
    }
}

// MARK: - extension
extension SandboxViewModel: ProductServiceDelegate {
    func getSandboxResult(_ sandbox: Sandbox) {
        sandboxData = sandbox
        delegate?.updateData()
    }
}
