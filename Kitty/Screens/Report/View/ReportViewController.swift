//
//  ReportViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class ReportViewController: UIViewController {
    var listItems: [Int] = [20, 30, 30, 10, 10]

    @IBOutlet weak var datePickerLabel: UILabel!
    var overviewLabel = UILabel()
    var chartStackView = UIStackView()

    @IBOutlet var chartView: UIView!
    lazy var reportViewModel: MonthlyReportProtocol = {
        return ReportViewModel()
    }()
    override func viewWillAppear(_ animated: Bool) {

        bindData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureChartView()
        configureChartStackView()

        // Do any additional setup after loading the view.
    }
    private func bindData() {
        let pickerDate: Date? = reportViewModel.getPickerDate()
        datePickerLabel.text = pickerDate?.toString(pattern: StringUtils.stringMonthYearPatternDate)
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

    private func configureChartStackView() {
        var customChartView = CustomHorizontalChartView(listPercentItems: listItems)
        view.addSubview(customChartView)

        chartView.addSubview(chartStackView)
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
