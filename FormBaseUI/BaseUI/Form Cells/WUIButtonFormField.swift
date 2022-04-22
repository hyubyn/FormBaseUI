//
//  WUIButtonFormField.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

enum WUIButtonState {
    case primary
    case disabled
    case secondary

    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return WUITheme.WUIColor.lightBlue
        case .disabled:
            return WUITheme.WUIColor.lightBlue.withAlphaComponent(0.6)
        case .secondary:
            return WUITheme.WUIColor.darkBlue
        }
    }
}

final class WUIButtonFormField: WUIBaseFormField {
    override var cellClass: WUIBaseTableCell.Type {
        return WUIButtonFormCell.self
    }
    
    var isEnabled = true
    var onButtonTapped: (() -> Void)?
    var title: String?
    var disabledBackgroundColor: UIColor?
    var state: WUIButtonState = .primary
    var borderColor: UIColor = .clear
    var borderWidth: CGFloat = 0
    var titleColor: UIColor = .white
    var cornerRadius: CGFloat = 30
    var titleFont = WUITheme.WUIFont.cardTitle
}
