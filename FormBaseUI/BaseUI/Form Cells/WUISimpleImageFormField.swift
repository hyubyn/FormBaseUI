//
//  WUISimpleImageFormField.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit

final class WUISimpleImageFormField: WUIBaseFormField {
    override var cellClass: WUIBaseTableCell.Type {
        return WUISimpleImageFormCell.self
    }
    var image: UIImage?
    var imageUrl: String?
    var cornerRadius: CGFloat = 0
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var imageHeight: CGFloat?
    var isFilledWidth = false
}
