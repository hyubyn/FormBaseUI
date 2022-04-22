//
//  WMBaseDisplayable.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

protocol WMBaseDisplayable {
    var imageUrl: String? { get set }
    var title: String? { get set }
    var subtitle: String? { get set }
}

class WMBaseDisplayableObject: WMBaseDisplayable {
    var imageUrl: String?
    var title: String?
    var subtitle: String?
    var buttonTitle: String?
    var placeHolder: UIImage?

    init(imageUrl: String?, title: String?,
         subtitle: String?, buttonTitle: String? = nil,
         placeholder: UIImage? = nil) {
        self.imageUrl = imageUrl
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.placeHolder = placeholder
    }
}
