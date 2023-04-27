//
//  ExpenseTableView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import UIKit

class HistoryTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    struct ViewData {
        let listDailyStatistic: [Money]?
    }

    var viewData = ViewData(listDailyStatistic: [])

    func numberOfSections(in _: UITableView) -> Int {
        return viewData.listDailyStatistic?.count ?? 0
    }

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return 12
    }

    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.zero)

        headerView.backgroundColor = .none
        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HistoryTableViewCell = (tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifer, for: indexPath)) as! HistoryTableViewCell
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
        cell.clipsToBounds = true
//        if let listExpenseReport = viewData.listDailyStatistic?[indexPath.section].listExpenseReport {
//            cell.loadData(viewData: HistoryTableViewCell.ViewData(dayName: viewData.listDailyStatistic?[indexPath.section].dayName, dailyExpense: viewData.listDailyStatistic?[indexPath.section].dailyExpense, listItemExpenseViewData: Array(listExpenseReport)))
//        }

        return cell
    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    override init(frame _: CGRect, style _: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .plain)
        initTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTableView()
    }

    // MARK: Method

    private func initTableView() {
        register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifer)
        delegate = self
        dataSource = self
        separatorStyle = .none
    }

    func loadData(viewData: HistoryTableView.ViewData) {
        self.viewData = viewData
        reloadData()
    }
}
