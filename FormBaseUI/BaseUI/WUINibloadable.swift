//
//  WUINibloadable.swift
//  wbea
//
//  Created by Hyubyn on 21/04/2022.
//

import UIKit

protocol WUINibLoadable: AnyObject {

    static var nibName: String { get }
}

extension WUINibLoadable where Self: UIView {

    static var nibName: String {

        return String(describing: self)
    }

    static func instantiate() -> Self {

        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
