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

    @IBOutlet weak var customHeaderView: CustomHeaderView!
    var overviewLabel = UILabel()

    @IBOutlet var chartView: UIView!
    lazy var reportViewModel: MonthlyReportProtocol = {
        return ReportViewModel()
    }()
    // MARK: - LifeCycle

    override func viewDidLoad() {
        self.navigationController?.delegate = self
        super.viewDidLoad()
        configureChartView()
        configureChartStackView()
    }
    // MARK: - Binding Data
    private func bindData() {
        customHeaderView.configureData(CustomHeaderView.ViewData(onTapGestureDetecture: { monthYearPickerViewController in
            self.onTapCalendarView(monthYearPickerViewController)
        }, datePicker: reportViewModel.filterDate))
    }
    private func reloadDataAfterUpdateFilterDate(filterDate: Date?) {
        reportViewModel.setCurrentFilterDate(filterDate: filterDate)
        self.bindData()
    }
}
// MARK: - Configure
extension ReportViewController {
    private func configureChartView() {
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont.customFont(.medium, size: 10)
        chartView.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: chartView.topAnchor),
            overviewLabel.leadingAnchor
                .constraint(equalTo: chartView.leadingAnchor)
        ])
    }
    private func configureChartStackView() {
        let customChartView = CustomHorizontalChartView(listPercentItems: listItems)
        view.addSubview(customChartView)

        customChartView.translatesAutoresizingMaskIntoConstraints = false
        customChartView.layer.cornerRadius = 8
        customChartView.layer.borderWidth = 1
        customChartView.layer.borderColor = UIColor(named: "B2EBF2")?.cgColor
        customChartView.clipsToBounds = true
        NSLayoutConstraint.activate([
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
        viewController.monthYearPickerViewModel.selectedMonth = reportViewModel.filterDate?.toString(pattern: StringUtils.onlyMonthPatternDate).getMonthType()
        viewController.monthYearPickerViewModel.callback = { [self] selectedMonth in
            Log.i("selectedMonth\(selectedMonth.rawValue)")
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
