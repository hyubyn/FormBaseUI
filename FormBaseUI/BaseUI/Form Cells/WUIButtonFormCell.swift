//
//  WUIButtonFormCell.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUIButtonFormCell: WUIBaseTableCell {
    @IBOutlet private weak var ctaButton: UIButton!
    
    override func update() {
        guard let field = self.field as? WUIButtonFormField else { return }
        ctaButton.setTitle(field.title, for: .normal)
        ctaButton.setTitleColor(field.titleColor, for: .normal)
        ctaButton.backgroundColor = field.state.backgroundColor
        ctaButton.cornerRadius = field.cornerRadius
        ctaButton.titleLabel?.font = field.titleFont
        ctaButton.borderColor = field.borderColor
        ctaButton.borderWidth = field.borderWidth
    }
    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        guard let field = self.field as? WUIButtonFormField, field.isEnabled else { return }
        field.onButtonTapped?()
    }
}
 
