//
//  WUICardViewFormCell.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUICardViewFormCell: WUIBaseTableCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var statusContainerView: UIView!
    @IBOutlet weak var statusLabelView: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pollutantValueLabel: UILabel!
    @IBOutlet weak var concentractionValueLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!



    override func update() {
        guard let field = self.field as? WUICardViewFormField, let qualityModel = field.airQualityModel else { return }
        cardTitleLabel.text = qualityModel.location?.name
        statusContainerView.backgroundColor = qualityModel.status?.status?.titleBackgroundColor
        statusLabelView.text = qualityModel.status?.title
        timeLabel.text = qualityModel.dateString
        pollutantValueLabel.text = qualityModel.pollutant
        concentractionValueLabel.text = qualityModel.concentration
        typeLabel.text = qualityModel.type
        containerView.backgroundColor = qualityModel.status?.status?.cardBackgroundColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let field = self.field as? WUICardViewFormField else { return }
        containerView.cornerRadius = field.cornerRadius
        containerView.layer.masksToBounds = true
        shadowView.layer.backgroundColor = UIColor.clear.cgColor
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowRadius = 4.0
    }
}
