//
//  JZWeekViewColors.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 29/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// cannot change for now, will implement theme in the future
class JZWeekViewColors {

    class var columnHeaderWeekday: UIColor { return UIColor(hexString: "#1C1C1E") }
    class var columnHeaderDay: UIColor { return UIColor(hexString: "#1C1C1E") }
    class var allDayHeader: UIColor { return UIColor(hex: 0x757575) }
    class var rowHeaderTime: UIColor { return UIColor(hexString: "#A6AAAE") }
    class var gridLine: UIColor { return UIColor(hexString: "#EDEEEF") }
    class var columnHeaderBackgroundColor: UIColor { return UIColor(hexString: "#1C1C1E") }
    class var rowsBackgroundColor: UIColor { return UIColor(hexString: "#494949") }

    class var today: UIColor { return UIColor(hexString: "#F26C5A") }
    class var appleCalendarRed: UIColor { return UIColor(hex: 0xFC3D39) }
}

extension UIColor {

    fileprivate convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    // Get UIColor by hex
    fileprivate convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
    convenience init(hexString: String) {
        let scanner = hexString.hasPrefix("#") ? Scanner(string: hexString.replacingOccurrences(of: "#", with: "")) : Scanner(string: hexString)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: 1)
    }

    static func hexString(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hexString: hex).withAlphaComponent(alpha)
    }
}
