//
//  WUIBaseCollectionViewCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit
import SDWebImage


protocol WUICollectionField: NSObject {
    var cellClass: WUIBaseCollectionViewCell.Type { get }
    var onActive: (() -> Void)? { get set }
    var displayableObject: WMBaseDisplayableObject? { get set }
}

class WUIBaseCollectionField: NSObject, WUICollectionField {
    var cellClass: WUIBaseCollectionViewCell.Type {
        return WUICollectionViewCell.self
    }

    var displayableObject: WMBaseDisplayableObject?
    var onActive: (() -> Void)?
    var titleFont: UIFont?
    var titleColor: UIColor = .black
    var subtitleFont: UIFont?
    var subtitleColor: UIColor = .black
}

class WUIBaseCollectionViewCell: UICollectionViewCell, WUIReusable {
    var field: WUIBaseCollectionField?

    func update() {}
}
