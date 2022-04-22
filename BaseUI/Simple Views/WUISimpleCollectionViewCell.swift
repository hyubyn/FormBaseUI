//
//  WUISimpleCollectionViewCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

class WUISimpleCollectionViewCell: WUIBaseCollectionViewCell {
    @IBOutlet weak var containerViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    private var isFlat = false
    @IBOutlet weak var bottomTextHeightForSmallSizeConstraint: NSLayoutConstraint?
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomTextLeadingConstraint: NSLayoutConstraint?
    @IBOutlet weak var bottomTextTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomContainerViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.cornerRadius = 5
        containerView.layer.masksToBounds = true
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowRadius = 3.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    // swiftlint:disable function_parameter_count
    func config(titleFont: UIFont,
                titleTextAlignment: NSTextAlignment,
                titleColor: UIColor,
                subtitleFont: UIFont,
                subtitleTextAlignment: NSTextAlignment,
                subtitleColor: UIColor,
                isLargeHeight: Bool,
                bottomHeight: CGFloat? = nil,
                cornerRadius: CGFloat = 5,
                zeroOffsetBottom: Bool = false) { // the leading and trailing of bottom text, this flag is used for Category items
        titleLabel.font = titleFont
        titleLabel.textAlignment = titleTextAlignment
        titleLabel.textColor = titleColor
        subtitleLabel.font = subtitleFont
        subtitleLabel.textAlignment = subtitleTextAlignment
        subtitleLabel.textColor = subtitleColor
        if zeroOffsetBottom {
            bottomTextLeadingConstraint?.constant = 0
            bottomTextTrailingConstraint?.constant = 0
        } else if !isLargeHeight {
            bottomTextLeadingConstraint?.constant = 10
        } else {
            bottomTextLeadingConstraint?.constant = 15
        }
        if let bottomHeight = bottomHeight {
            bottomContainerViewHeightConstraint?.constant = bottomHeight
        } else {
            bottomContainerViewHeightConstraint?.isActive = false
        }
        if isLargeHeight {
            containerViewLeadingConstraint.constant = 20
            containerViewTrailingConstraint.constant = 20
        }
        containerView.cornerRadius = cornerRadius
        layoutIfNeeded()
    }
    
    func setupData(model: WMBaseDisplayableObject) {
        imageView.sd_setImage(with: URL(string: model.imageUrl ?? ""), placeholderImage: model.placeHolder)
        if let title = model.title, title != "" {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
        
        if let subtitle = model.subtitle {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.isHidden = true
        }
        layoutIfNeeded()
    }
    
    func setupData(imageUrl: String?, image: UIImage? = nil, title: String?, subtitle: String?, isFlat: Bool = false, imageContentMode: UIView.ContentMode = .scaleAspectFill) {
        if let url = imageUrl {
            imageView.sd_setImage(with: URL(string: url))
        } else {
            imageView.image = image
        }
        imageView.contentMode = imageContentMode
        if let title = title, title != "" {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
        if let subtitle = subtitle {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.isHidden = true
        }
        if isFlat {
            shadowView.clipsToBounds = true
        }
    }
}
