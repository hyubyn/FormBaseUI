//
//  WUITheme.swift
//  wbea
//
//  Created by Hyubyn on 13/04/2022.
//

import UIKit

final class WUITheme {
    struct WUIColor {
        static let lightBlue = UIColor(named: "lightBlue")!
        static let darkBlue = UIColor(named: "darkBlue")!
        static let green = UIColor(named: "green")!
        static let darkGrey = UIColor(named: "darkGrey")!
        static let grey = UIColor(named: "grey")!
        static let lightGrey = UIColor(named: "lightGrey")!
        static let white = UIColor(named: "white")!
    }

    struct WUIFont {
        static let header = UIFont.boldSystemFont(ofSize: 42)
        static let header2 = UIFont.boldSystemFont(ofSize: 22)
        static let cardData = UIFont.systemFont(ofSize: 24, weight: .medium)
        static let dynamicInfo = UIFont.boldSystemFont(ofSize: 20)
        static let cardTitle = UIFont.boldSystemFont(ofSize: 17)
        static let sectionTitle = UIFont.systemFont(ofSize: 14)
        static let bodyContent = UIFont.systemFont(ofSize: 16)
        static let label = UIFont.systemFont(ofSize: 12)
    }
}
