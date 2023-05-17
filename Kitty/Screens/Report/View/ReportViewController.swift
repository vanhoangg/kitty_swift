//
//  ReportViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class ReportViewController: UIViewController {
    var listItems: [Int] = [20, 30, 30, 10, 10]

    @IBOutlet weak var customHeaderView: CustomHeaderView!
    var overviewLabel = UILabel()

    @IBOutlet var chartView: UIView!
    lazy var reportViewModel: MonthlyReportProtocol = {
        return ReportViewModel()
    }()
    override func viewWillAppear(_ animated: Bool) {

        bindData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureChartView()
        configureChartStackView()
//        configureCustomHeaderView()

        // Do any additional setup after loading the view.
    }

    private func bindData() {
        customHeaderView.configureData(CustomHeaderView.ViewData(datePickerText: reportViewModel.datePickerText?.toString(pattern: StringUtils.stringMonthYearPatternDate)))
    }
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
    private func onTapCalendarView() {
        let monthYearPicker = MonthYearPickerViewController()
        monthYearPicker.modalPresentationStyle = .popover
        monthYearPicker.preferredContentSize = CGSize(width: screenWidth, height: screenWidth * 0.8)
        monthYearPicker.popoverPresentationController?.delegate = self
        monthYearPicker.popoverPresentationController?.sourceView = customHeaderView.calendarView
        self.present(monthYearPicker, animated: true, completion: nil)
        monthYearPicker.monthYearPickerViewModel.selectedMonth = reportViewModel.datePickerText?.toString(pattern: StringUtils.onlyMonthPatternDate).getMonthType()
        monthYearPicker.monthYearPickerViewModel.callback = { [self] selectedMonth in
            let filterDate: Date? = FunctionUtils.createDateFromMonth(monthRawValue: selectedMonth.rawValue)
            homeViewModel.setCurrentFilterDate(filterDate: filterDate)
            self.bindData()
        }
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
// MARK: - UINavigationControllerDelegate

extension ReportViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is ReportViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ReportViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.permittedArrowDirections = .unknown
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        Log.w("Popover Dismissed!")
    }
}
