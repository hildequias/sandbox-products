//
//  UIColor+Themes.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

public extension UIColor {
    
    enum Palette: UInt32, CaseIterable {
        // MARK: Cores definidas
        /// #1b2747
        case darkBlue
        
        /// #767676
        case gray
        
        /// #4b4b4b
        case mediumDarkGray
        
        // MARK: Cores legadas
        /// #24A5D3
        case legacyBlue
    }
}

public extension UIColor {
    convenience init(named: Palette) {
        let bundle = Bundle(identifier: "Colors")
        self.init(named: "\(named)", in: bundle, compatibleWith: nil)!
    }
    
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex6 & 0x00FF00) >> 8) / divisor
        let blue = CGFloat(hex6 & 0x0000FF) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
