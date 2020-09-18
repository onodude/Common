//
//  Created by Onur Erdemol
//  Copyright © 2020 Onur Erdemol
//  All rights reserved
//

import UIKit

class CommonTableView: UITableView {

    var ctrlRefresh: UIRefreshControl = UIRefreshControl()

    // MARK: - Initializers

    convenience init(bgColor: UIColor, style: UITableView.Style, superview: UIView, delegate: Any) {

        self.init(frame: .zero, style: style)

        self.backgroundColor = bgColor
        self.separatorStyle = .none

        self.delegate = delegate as? UITableViewDelegate
        self.dataSource = delegate as? UITableViewDataSource

        self.sectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = 0

        self.sectionFooterHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = 0

        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false

        superview.addSubview(self)

    }

    convenience init(style: UITableView.Style, superview: UIView, delegate: Any) {

        self.init(frame: .zero, style: style)

        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false

        self.backgroundColor = .clear
        self.separatorStyle = .none

        self.delegate = delegate as? UITableViewDelegate
        self.dataSource = delegate as? UITableViewDataSource

        self.sectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = 0

        self.sectionFooterHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = 0

        superview.addSubview(self)

    }

    // MARK: - Functions

    func stopRefreshControl() {

        if self.ctrlRefresh.isRefreshing {

            self.ctrlRefresh.endRefreshing()

        }

    }

    func addRefreshController(tintColor: UIColor, action: Selector, target: Any) {

        self.ctrlRefresh.tintColor = tintColor
        self.ctrlRefresh.addTarget(target, action: action, for: .valueChanged)

        if #available(iOS 10.0, *) {
            self.refreshControl = self.ctrlRefresh
        } else {
            self.addSubview(self.ctrlRefresh)
        }

    }

    func scrollToTopRow() {

        self.setContentOffset(CGPoint.zero, animated: true)

    }

}
