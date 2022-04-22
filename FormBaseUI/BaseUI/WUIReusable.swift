//
//  WUIReusable.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit


protocol WUIReusable: AnyObject {
    static var reuseIdentifier: String { get }
    static var hNib: UINib? { get }
}

extension WUIReusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    static var hNib: UINib? {
        let bundle = Bundle(for: self)
        if bundle.path(forResource: String(describing: self), ofType: "nib") != nil {
            return UINib(nibName: String(describing: self), bundle: bundle)
        }
        return nil
    }
}

extension UITableView {
    final func registerReusableCell<T: UITableViewCell>(cellType: T.Type)
        where T: WUIReusable {
            if let nib = cellType.hNib {
                self.register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
            } else {
                self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
            }
    }

    final func dequeueReusableTableViewCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: WUIReusable {
            guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand"
                )
            }
            return cell
    }

    final func registerReusableView<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: WUIReusable {
            if let nib = headerFooterViewType.hNib {
                self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
            } else {
                self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
            }
    }

    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T?
        where T: WUIReusable {
            guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
                fatalError(
                    "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
                        + "matching type \(viewType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the header/footer beforehand"
                )
            }
            return view
    }
}

extension UICollectionView {
    func registerReusableCell<T: UICollectionViewCell>(cellType: T.Type) where T: WUIReusable {
        if cellType.hNib != nil {
            self.register(cellType.hNib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }

    final func dequeueReusableCollectionViewCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: WUIReusable {
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath as IndexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand"
                )
            }
            return cell
    }

    func registerReusableSupplementaryView<T: WUIReusable>(elementKind: String, _: T.Type) {
        if let nib = T.hNib {
            self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: NSIndexPath) -> T where T: WUIReusable {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
