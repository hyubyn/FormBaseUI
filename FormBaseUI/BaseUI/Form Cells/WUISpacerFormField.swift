//
//  WUISpacerFormField.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

class WUISpacerFormField: WUIBaseFormField {
    override var cellClass: WUIBaseTableCell.Type {
        return WUISpacerFormCell.self
    }
    
    init(height: CGFloat, backgroundColor: UIColor = .clear) {
        self.height = height
        self.backgroundColor = backgroundColor
    }
    
    var height: CGFloat = 20
    var backgroundColor: UIColor = .clear
}
