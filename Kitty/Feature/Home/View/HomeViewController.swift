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
    @IBOutlet weak var incomeStatView: ItemHomeStatView!
    @IBOutlet weak var balanceStatView: ItemHomeStatView!
    @IBOutlet weak var paymentStatView: ItemHomeStatView!
    @IBOutlet weak var homeStatStackView: UIStackView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var historyTableView: HistoryTableView!
    
    
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
     
        paymentStatView.loadData(viewData: ItemHomeStatView.ViewData(icon: AssetIcon.icPayment, value: String(-(homeViewModel.monthlyStatistics?.monthExpense ?? 0)), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
        
        balanceStatView.loadData(viewData: ItemHomeStatView.ViewData(icon: AssetIcon.icWallet, value: String(homeViewModel.monthlyStatistics?.monthBalance ?? 0 ), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
       
        incomeStatView.loadData(viewData: ItemHomeStatView.ViewData(icon: AssetIcon.icBank, value: String(homeViewModel.monthlyStatistics?.monthIncome ?? 0), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func configHistoryTableView(){
        historyTableView.loadData(viewData:  HistoryTableView.ViewData(listDayStatistic: homeViewModel.monthlyStatistics?.listStatisticDay))
        historyTableView.bounces = false
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 300
        historyTableView.sizeToFit()
    }
}
