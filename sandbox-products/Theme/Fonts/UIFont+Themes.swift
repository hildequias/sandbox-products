//
//  UIFont+Themes.swift
//  PBUIKit
//
//  Created by Fábio Salata on 16/01/20.
//  Copyright © 2020 PagSeguro. All rights reserved.
//

import UIKit

public extension UIFont {
    // - MARK: Font styles
    struct Style {
        // Headers
        public static let h1 = UIFont.systemFont(ofSize: 34, weight: .semibold)
        public static let h2 = UIFont.systemFont(ofSize: 24, weight: .regular)
        public static let h3 = UIFont.systemFont(ofSize: 20, weight: .semibold)
        public static let h4 = UIFont.systemFont(ofSize: 18, weight: .semibold)

        // Subtitle
        public static let subtitle = UIFont.systemFont(ofSize: 16, weight: .semibold)

        // Body
        public static let body = UIFont.systemFont(ofSize: 16, weight: .regular)
        public static let bodySmall = UIFont.systemFont(ofSize: 14, weight: .regular)

        // Overline
        public static let overline = UIFont.systemFont(ofSize: 12, weight: .semibold)

        // Button
        public static let button = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}

// - MARK: Headers
@IBDesignable
public class H1Label: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.h1
    }
}

@IBDesignable
public class H2Label: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.h2
    }
}

@IBDesignable
public class H3Label: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.h3
    }
}

@IBDesignable
public class H4Label: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.h4
    }
}

// - MARK: Subtitle
@IBDesignable
public class SubtitleLabel: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.subtitle
    }
}

// - MARK: Body
@IBDesignable
public class BodyLabel: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.body
    }
}

@IBDesignable
public class BodySmallLabel: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.bodySmall
    }
}

// - MARK: Overline
@IBDesignable
public class OverlineLabel: StyledLabel {
    override var fontStyle: UIFont {
        return UIFont.Style.overline
    }
}
