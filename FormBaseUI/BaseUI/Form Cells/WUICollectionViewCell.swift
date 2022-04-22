//
//  WUICollectionViewCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

final class WUICollectionViewCell: WUIBaseCollectionViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.defaultShadow = true
        containerView.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override func update() {
        guard let field = field else { return }
        titleLabel.textColor = field.titleColor
        if let titleFont = field.titleFont {
            titleLabel.font = titleFont
        }
        subtitleLabel.textColor = field.subtitleColor
        if let font = field.subtitleFont {
            subtitleLabel.font = font
        }
        if let model = field.displayableObject {
            imageView.sd_setImage(with: URL(string: model.imageUrl ?? ""), completed: nil)
            titleLabel.text = model.title
            subtitleLabel.text = model.subtitle
        }
    }

}
