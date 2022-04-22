//
//  WUICollectionViewFormField.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

final class WUICollectionViewFormField: WUIBaseFormField {
    override var cellClass: WUIBaseTableCell.Type {
        return WUICollectionViewFormCell.self
    }
    
    var items = [WMBaseDisplayableObject]()
    var didSelectItem: ((Int) -> Void)?
    var numberOfColumns: CGFloat = 2
    var itemHeight: CGFloat = 120
    var spacing: CGFloat = 20.0
    var isLargeHeight = true
    var cornerRadius: CGFloat = 5
    var bottomHeight: CGFloat?
    var titleFont = WUITheme.WUIFont.cardTitle
    var titleTextAlignment: NSTextAlignment = .center
    var titleColor: UIColor = WUITheme.WUIColor.lightBlue
    var subtitleFont = WUITheme.WUIFont.label
    var subtitleTextAlignment: NSTextAlignment = .center
    var subtitleColor: UIColor = WUITheme.WUIColor.darkGrey
}
