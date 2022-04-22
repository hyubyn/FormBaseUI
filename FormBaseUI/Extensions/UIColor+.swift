//
//  UIColor+.swift
//  wbea
//
//  Created by Hyubyn on 13/04/2022.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else {
                if ((hexColor.count) != 6) {
                    return nil
                }

                var rgbValue:UInt64 = 0
                Scanner(string: hexColor).scanHexInt64(&rgbValue)
                r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
                g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
                b = CGFloat(rgbValue & 0x0000FF) / 255.0
                a = CGFloat(1.0)
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }

        return nil
    }

    convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
