//
//  WUISimpleImageFormCell.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUISimpleImageFormCell: WUIBaseTableCell {
    @IBOutlet private weak var imageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cellImageView: UIImageView!

    override func update() {
        super.update()
        guard let field = self.field as? WUISimpleImageFormField else { return }
        if let image = field.image {
            cellImageView.image = image
        } else if let imageUrl = field.imageUrl {
            cellImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        if let imageHeight = field.imageHeight {
            cellImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        }
        cellImageView.contentMode = field.contentMode
        cellImageView.layer.masksToBounds = true
        cellImageView.cornerRadius = field.cornerRadius
        if field.isFilledWidth {
            imageLeadingConstraint?.constant = 0
            imageTrailingConstraint?.constant = 0
        }
    }
    
}
