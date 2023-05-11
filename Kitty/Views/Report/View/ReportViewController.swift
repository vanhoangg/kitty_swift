//
//  ReportViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class ReportViewController: UIViewController {
    var listItems: [Int] = [20, 30, 30, 10, 10]

    var overviewLabel = UILabel()
    var chartStackView = UIStackView()

    @IBOutlet var chartView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureChartView()
        configureChartStackView()

        // Do any additional setup after loading the view.
    }

    private func configureChartView() {
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont.customFont(.medium, size: 10)
        chartView.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: chartView.topAnchor),
            overviewLabel.leadingAnchor
                .constraint(equalTo: chartView.leadingAnchor
                           )
        ])
    }

    private func configureChartStackView() {
        chartStackView.axis = .horizontal
        chartStackView.distribution = .fill
        chartStackView.spacing = 0
        chartStackView.autoresizesSubviews = true

        chartView.addSubview(chartStackView)
        chartStackView.translatesAutoresizingMaskIntoConstraints = false
        chartStackView.layer.cornerRadius = 8
        chartStackView.layer.borderWidth = 1
        chartStackView.layer.borderColor = UIColor(named: "B2EBF2")?.cgColor
        chartStackView.clipsToBounds = true
        NSLayoutConstraint.activate([
            chartStackView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            chartStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            chartStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            chartStackView.heightAnchor.constraint(equalTo: chartStackView.widthAnchor, multiplier: 36 / 328, constant: 8)
        ])
        for index in 0 ... listItems.count - 1 {
            //            let itemView = UIView(frame: CGRect(x: 0, y: 0, width:chartStackView.bounds.width * (Double(listItems[index])/100), height: chartStackView.bounds.height))

            let itemView = UIView(frame: CGRect.zero)
            chartStackView.addArrangedSubview(itemView)

            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.widthAnchor.constraint(equalTo: chartView.widthAnchor, multiplier: Double(listItems[index]) / 100, constant: 0)

            ])
            itemView.backgroundColor = .random()
            //                chartStackView.addSubview(itemView)

            print("======= \(chartView.frame.width)")
            print("======= \(index)")
            print("======= \(itemView.bounds.width)")

            print("======= \(Double(listItems[index]) / 100)")
        }
    }
}
