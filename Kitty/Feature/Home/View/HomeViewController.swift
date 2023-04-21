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
        navigationController?.setNavigationBarHidden(true, animated: false)
        bindData()
    }
    
    // MARK: -Method
    private func bindData(){
        
//        configCalendarView()
        configHomeStatView()
        configHistoryTableView()
    }
}

// MARK: - Extension
extension HomeViewController {
    private func configHomeStatView(){
     
        expenseMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icPayment, value: String(-(homeViewModel.monthlyStatistics?.monthlyExpense ?? 0)), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
        
        balanceMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icWallet, value: String(homeViewModel.monthlyStatistics?.monthlyBalance ?? 0 ), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
       
        incomeMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icBank, value: String(homeViewModel.monthlyStatistics?.monthlyIncome ?? 0), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func configHistoryTableView(){
        historyTableView.loadData(viewData:  HistoryTableView.ViewData(listDailyStatistic: homeViewModel.monthlyStatistics?.listDailyStatistic))
        historyTableView.bounces = false
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 300
        historyTableView.sizeToFit()
    }
}
