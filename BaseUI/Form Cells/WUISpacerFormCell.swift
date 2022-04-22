//
//  WUISpacerFormCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

final class WUISpacerFormCell: WUIBaseTableCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    
    override func update() {
        super.update()
        guard let field = self.field as? WUISpacerFormField else { return }
        contentHeightConstraint.constant = field.height
        containerView.backgroundColor = field.backgroundColor
        layoutIfNeeded()
    }
}
