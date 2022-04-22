//
//  WUICollectionViewFormCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

final class WUICollectionViewFormCell: WUIBaseTableCell {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var items = [WMBaseDisplayableObject]()
    
    override func setupLayout() {
        super.setupLayout()
        collectionView.registerReusableCell(cellType: WUISimpleCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func update() {
        guard let field = self.field as? WUICollectionViewFormField else { return }
        items = field.items
        collectionView.reloadData()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 20)
        collectionView.layoutIfNeeded()
        return collectionView.collectionViewLayout.collectionViewContentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        items = []
        collectionView.reloadData()
    }
}

extension WUICollectionViewFormCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCollectionViewCell(for: indexPath, cellType: WUISimpleCollectionViewCell.self)
        if let field = self.field as? WUICollectionViewFormField {
            cell.config(titleFont: field.titleFont, titleTextAlignment: field.titleTextAlignment, titleColor: field.titleColor, subtitleFont: field.subtitleFont, subtitleTextAlignment: field.subtitleTextAlignment, subtitleColor: field.subtitleColor, isLargeHeight: field.isLargeHeight, bottomHeight: field.bottomHeight, cornerRadius: field.cornerRadius)
        }
        cell.setupData(model: items[indexPath.row])
        return cell
    }
    
}

extension WUICollectionViewFormCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let field = self.field as? WUICollectionViewFormField else { return }
        field.didSelectItem?(indexPath.row)
    }
}

extension WUICollectionViewFormCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let field = self.field as? WUICollectionViewFormField {
            let width = (collectionView.frame.size.width - (field.numberOfColumns + 1) * field.spacing) / field.numberOfColumns
            return CGSize(width: width, height: field.itemHeight)
        }
        return CGSize(width: 100, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if let field = self.field as? WUICollectionViewFormField {
            return field.spacing
        }
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if let field = self.field as? WUICollectionViewFormField {
            return UIEdgeInsets(top: 0, left: field.spacing, bottom: 0, right: field.spacing)
        }
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
