//
//  ReportViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class ReportViewController: UIViewController {
    // MARK: - Properties
    var listItems: [Int] = [20, 30, 30, 10, 10]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customHeaderView: CustomHeaderView!

    @IBOutlet var chartView: UIView!
    lazy var reportViewModel: MonthlyReportProtocol = {
        return ReportViewModel()
    }()
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        reportViewModel.getPickerDate()
        /// Configure
        bindData()
    }
    override func viewDidLoad() {
        self.navigationController?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identiferTest")
        super.viewDidLoad()
        configureChartView()
        bindData()
    }
    // MARK: - Binding Data
    private func bindData() {
        customHeaderView.configureData(CustomHeaderView.ViewData(onTapGestureDetecture: { monthYearPickerViewController in
            self.onTapCalendarView(monthYearPickerViewController)
        }, datePicker: reportViewModel.currentFilterDate))
    }
    private func reloadDataAfterUpdateFilterDate(filterDate: Date?) {
        reportViewModel.setCurrentFilterDate(filterDate: filterDate)
        self.bindData()
    }
}
// MARK: - Configure
extension ReportViewController {
    private func configureChartView() {
        // MARK: - Overview Label
        let overviewLabel = UILabel()
        overviewLabel.text = "Overview".uppercased()
        overviewLabel.font = UIFont.customFont(.regular, size: 10)
        overviewLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
         // MARK: - Custom Chart
        let customChartView = CustomHorizontalChartView(listPercentItems: listItems)
        customChartView.translatesAutoresizingMaskIntoConstraints = false
        customChartView.layer.cornerRadius = 8
        customChartView.layer.borderWidth = 1
        customChartView.layer.borderColor = UIColor(named: "B2EBF2")?.cgColor
        customChartView.clipsToBounds = true
        chartView.addSubview(overviewLabel)
        chartView.addSubview(customChartView)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: chartView.topAnchor),
            overviewLabel.leadingAnchor
                .constraint(equalTo: chartView.leadingAnchor),
            customChartView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            customChartView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            customChartView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            customChartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 36 / 780, constant: 0)
        ])
    }
}
// MARK: - Action
extension ReportViewController {
    private func onTapCalendarView(_ viewController: MonthYearPickerViewController) {
        self.present(viewController, animated: true, completion: nil)
        viewController.monthYearPickerViewModel.selectedMonth = reportViewModel.currentFilterDate?.toString(pattern: StringUtils.onlyMonthPatternDate).getMonthType()
        viewController.monthYearPickerViewModel.callback = { [self] selectedMonth in

            let filterDate: Date? = FunctionUtils.createDateFromMonth(monthRawValue: selectedMonth.rawValue)
            reloadDataAfterUpdateFilterDate(filterDate: filterDate)
        }
    }

}
// MARK: - UINavigationControllerDelegate

extension ReportViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is ReportViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}
// MARK: - UITableViewDelegate && UITableViewDatasource
extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "identiferTest", for: indexPath))
        return cell
    }

}
