//
//  WUIBaseFormField.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

protocol WUIFormField: NSObject {
    var cellClass: WUIBaseTableCell.Type { get }
    var onActive: (() -> Void)? { get set }
    var isUpdated: Bool { get set }
    var onUpdate: (() -> Void)? { get set }
}

class WUIBaseFormField: NSObject, WUIFormField {
    var cellClass: WUIBaseTableCell.Type {
        return WUIBaseTableCell.self
    }
    var onActive: (() -> Void)?
    var isUpdated = false
    var onUpdate: (() -> Void)?
    var isCurrentResponder = false
}

