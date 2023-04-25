//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewModel  = HomeViewModel()
    // MARK: - IBoutlet
    @IBOutlet weak var homeStatStackView: UIStackView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var historyTableView: HistoryTableView!
    @IBOutlet weak var expenseMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet weak var incomeMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet weak var balanceMonthlyReportView: ItemMonthlyReportView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.setNavigationBarHidden(true, animated: false)
        build()
    }
    
    // MARK: -Method
    private func build(){
        
//        configCalendarView()
        configHomeStatView()
        configHistoryTableView()
        configFloatingButton()

    }
}

// MARK: - Extension
extension HomeViewController {
    private func configFloatingButton(){
        let addButton = IconTextButton();
        view.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: "Add new", image:UIImage(named: AssetIcon.icAdd)))
        
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor,multiplier: 48/130,constant: 0),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -32)])
        addButton.configureStyle(cornerRadius: 22,borderWidth: 0,backgroundColor: UIColor(named: AssetColor.buttonBackgroundColor),textColor: .white)
        addButton.addTarget(self, action: #selector(onPressAddExpense), for: .touchUpInside)
    }
    @objc func onPressAddExpense() {
        let addScreenViewController = AddScreenViewController()
             self.navigationController?.pushViewController(addScreenViewController, animated: true)
    }
    private func configHomeStatView(){
     
//        expenseMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icPayment, value: String(-(homeViewModel.monthlyStatistics?.monthlyExpense ?? 0)), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
//
//        balanceMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icWallet, value: String(homeViewModel.monthlyStatistics?.monthlyBalance ?? 0 ), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
//
//        incomeMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icBank, value: String(homeViewModel.monthlyStatistics?.monthlyIncome ?? 0), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func configHistoryTableView(){
//        if let listDaily = homeViewModel.monthlyStatistics?.listDailyStatistic {
//            historyTableView.loadData(viewData:  HistoryTableView.ViewData(listDailyStatistic: Array(listDaily)  ))
//        }
        
        historyTableView.bounces = false
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 300
        historyTableView.sizeToFit()
    }
}
