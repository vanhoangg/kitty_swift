//
//  ReportViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class ReportViewController: UIViewController {
    var listItems: [Int] = [20,30,30,10,10]
    var listColors: [UIColor] = [.systemRed,.systemBlue,.systemFill,.systemCyan,.systemPink]
    
    var overviewLabel = UILabel()
    var chartStackView = UIStackView()
    
    
    @IBOutlet weak var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureChartView()
        configureChartStackView()
        
        // Do any additional setup after loading the view.
    }
    
    private func configureChartView(){
        overviewLabel.text = "Overview"
        overviewLabel.font = UIFont.CustomFont(.medium, size: 10)
        chartView.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: chartView.topAnchor),
            overviewLabel.leadingAnchor
                .constraint(equalTo: chartView.leadingAnchor
                           )])
        
        
    }
    private func configureChartStackView(){
        
        chartStackView.axis = .horizontal
//        chartStackView.distribution = .fill
        chartStackView.spacing = 0
        chartView.addSubview(chartStackView)
        chartStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chartStackView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor,constant: 8),
            chartStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            chartStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            chartStackView.bottomAnchor.constraint(equalTo: chartView.bottomAnchor,constant: 8)
            ])
        for index in 0...listItems.count-1 {
//            let itemView = UIView(frame: CGRect(x: 0, y: 0, width:chartStackView.bounds.width * (Double(listItems[index])/100), height: chartStackView.bounds.height))
            
            
            
        let    itemView = UIView()
            
            NSLayoutConstraint.activate([
                itemView.widthAnchor.constraint(equalToConstant: chartView.frame.width * (Double(listItems[index])/100)),
                
            ])
            itemView.backgroundColor = listColors[index]
//                chartStackView.addSubview(itemView)
            
            print("======= \(chartView.frame.width)")
            print("======= \(index)")
            print("======= \(itemView.bounds.width)")
            
            
            print("======= \(Double(listItems[index])/100)")
            chartStackView.addArrangedSubview(itemView)
        }
        
    }

}
