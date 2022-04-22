//
//  WUISimpleTextFormField.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUISimpleTextFormField: WUIBaseFormField {
    
    override var cellClass: WUIBaseTableCell.Type {
        return WUISimpleTextFormCell.self
    }
    
    var text: String?
    var font: UIFont?
    var attributedText: NSAttributedString?
    var textAlignment: NSTextAlignment = .left
    var textColor: UIColor = .black
    var isWebBasedContent = false
    var backgroundColor: UIColor?
    var height: CGFloat?
}
