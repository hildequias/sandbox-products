//
//  UIColor+Themes.swift
//  PBKit
//
//  Created by Fábio Salata on 10/12/19.
//  Copyright © 2019 Rodrigo Gregory Vianna. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // Paleta de cores primárias do Design System.
    // Os nomes das cores devem ser adicionados a este enum e a definição no `Colors.xcassets`
    enum Palette: UInt32, CaseIterable {
        // MARK: Cores definidas pelo Design System
        /// #5CBC4C
        case greenFlag
        /// #53B244
        case greenFlagDark
        /// #DCE35F
        case greenAvocado
        /// #1BB99A
        case greenMermaid
        /// #0078AD
        case blueOcean
        /// #5AB9DB
        case blueViking
        /// #DDEFF7
        case blueWater
        /// #FFA100
        case orangeAnnoying
        /// #B00020
        case redCarmin
        /// #FFCC32
        case yellowSunglow
        /// #FDFF9B
        case yellowConfetti
        /// #A9A9A9
        case darkGray
        /// #222222
        case blackCharcoal
        /// #595959
        case greyAsphalt
        /// #767676
        case greySmoke
        /// #949494
        case greyDust
        /// #E2E2E2
        case greyCloud
        /// #E7E7E7
        case greyLine
        /// #F3F4F5
        case greyRhino
        /// #FAFAFA
        case greyPsychoKiller
        
        // MARK: Cores legadas
        /// #24A5D3
        case legacyBlue
    }
}

public extension UIColor {
    
    /// Método de conveniência para inicar uma cor utilizando a palheta padrão do design system.
    /// Verifica a versão do sistema para escolher como inicializar.
    /// -  Utiliza as cores nomeadas do catálogo de cores (Colors.xcassets). A chave do enum Palette deve ser o nome da cor no catálogo.
    /// - Parameter named: Enum com as cores padrão do app com seu nome no catálogo de cores e hexadecimal.
    convenience init(named: Palette) {
        let bundle = Bundle(identifier: Environment.bundleId)
        self.init(named: "\(named)", in: bundle, compatibleWith: nil)!
    }
    
    /// Helper para inicailizar uma cor através do seu hexadecimal.
    /// - Parameters:
    ///   - hex6: Cor em formato hexadecimal de 6 dígitos. Ex: 0x5CBC4C.
    ///   - alpha: Transparência. Valor default = 1.
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex6 & 0x00FF00) >> 8) / divisor
        let blue = CGFloat(hex6 & 0x0000FF) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
