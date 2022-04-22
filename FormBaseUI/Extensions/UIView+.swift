//
//  UIView+.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

extension UIView {
    @IBInspectable var defaultShadow: Bool {
        set {
            if newValue {
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.1
                self.layer.shadowRadius = 3
                self.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.layer.masksToBounds = false
                self.layer.rasterizationScale = UIScreen.main.scale
                self.layer.shouldRasterize = true
            }
        } get {
            return self.layer.shadowOpacity > 0
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    func pinEdgesToSuperView() {
        guard let superView = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }

    func pinEdgesToSuperView(inset: CGFloat) {
        guard let superView = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: inset).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: inset).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: inset).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: inset).isActive = true
    }
}
