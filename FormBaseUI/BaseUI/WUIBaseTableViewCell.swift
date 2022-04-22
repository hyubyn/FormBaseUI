//
//  WUIBaseTableViewCell.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

class WUIBaseTableCell: UITableViewCell, WUIReusable {
    var field: WUIFormField? {
        didSet {
            update()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupLayout()
    }

    func setupLayout() {}

    func update() {}
}
