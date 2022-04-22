//
//  WUIFormViewController.swift
//  wbea
//
//  Created by Hyubyn on 14/04/2022.
//

import UIKit

class WUIFormViewController: WUIBaseViewController {
    private let tableView = UITableView(frame: .zero)
    private let refreshControl = UIRefreshControl()
    var fields = [WUIBaseFormField]() {
        didSet {
            self.setupTableView()
        }
    }

    var isLoadMoreable: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.pinEdgesToSuperView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 60
        tableView.showsVerticalScrollIndicator = false
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.backgroundColor = .clear
        setupFields()
        setupHeaderView()
        setupTableView()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }

    func setupFields() {

    }

    func setupHeaderView() {

    }

    @objc func refreshData() {
        endRefreshing()
    }

    func endRefreshing() {
        refreshControl.endRefreshing()
    }

    func registerReusableView<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type)
        where T: WUIReusable {
            if let nib = headerFooterViewType.hNib {
                tableView.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
            } else {
                tableView.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
            }
    }

    func registerHeaderWith(nib: UINib?, reuseIdentifier: String) {
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

    private func setupTableView() {
        for index in 0 ..< fields.count {
            let field = fields[index]
            tableView.registerReusableCell(cellType: field.cellClass)
            field.onUpdate = { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
                }
            }
        }
        tableView.reloadData()
        view.layoutIfNeeded()
    }

    func addSpacer(height: CGFloat = 20, color: UIColor = .clear) -> WUISpacerFormField {
        return WUISpacerFormField(height: height, backgroundColor: color)
    }

    func addSeparator() -> WUISpacerFormField {
        return WUISpacerFormField(height: 1.0, backgroundColor: WUITheme.WUIColor.lightGrey)
    }

    func addDynamicSpacer() -> WUIDynamicVerticalSpacer {
        return WUIDynamicVerticalSpacer()
    }

    func scrollToTop() {
        tableView.setContentOffset(.zero, animated: true)
    }

    // MARK: - Reload data
    func reloadFields() {
        for index in 0 ..< fields.count {
            let field = fields[index]
            if field.isUpdated {
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
            }
        }
    }

    func reloadForm() {
        tableView.reloadData()
    }

    func loadMore() {

    }
}

// MARK: - UITableViewDataSource
extension WUIFormViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields[indexPath.row]
        field.isUpdated = false
        let cell = tableView.dequeueReusableTableViewCell(for: indexPath, cellType: field.cellClass)
        cell.field = field
        if indexPath.row == fields.count - 2 && isLoadMoreable {
            loadMore()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let field = fields[indexPath.row]
        if field is WUIDynamicVerticalSpacer {
            if tableView.contentSize.height > tableView.frame.size.height {
                return 20
            } else {
                return tableView.frame.size.height - tableView.contentSize.height
            }
        } else {
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UITableViewDelegate
extension WUIFormViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let field = fields[indexPath.row]
        field.onActive?()
    }
}
