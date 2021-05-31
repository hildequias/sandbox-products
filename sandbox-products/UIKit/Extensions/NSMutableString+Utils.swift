//
//  NSMutableString+Utils.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

extension NSMutableAttributedString {

    func setColorForString(textToFind: String, color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options:NSString.CompareOptions.caseInsensitive);
        if range.location != NSNotFound {
            self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range);
        }
    }
}
