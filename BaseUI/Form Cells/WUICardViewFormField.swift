//
//  WUICardViewFormField.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUICardViewFormField: WUIBaseFormField {
    override var cellClass: WUIBaseTableCell.Type {
        return WUICardViewFormCell.self
    }

    var isEnabled = true
    var onButtonTapped: (() -> Void)?
    var cornerRadius: CGFloat = 10
    var airQualityModel: WMAirQuality?
}
