//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewModel = HomeViewModel()

    // MARK: - IBoutlet

    @IBOutlet var homeStatStackView: UIStackView!
    @IBOutlet var calendarView: UIView!
    @IBOutlet var historyTableView: HistoryTableView!
    @IBOutlet var expenseMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var incomeMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var balanceMonthlyReportView: ItemMonthlyReportView!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self

        build()
    }

    // MARK: - Method

    private func build() {
//        configCalendarView()
        
        configHistoryTableView()
        configFloatingButton()
        bindData()
    }
}

// MARK: - Extension

extension HomeViewController {
    private func configFloatingButton() {
        let addButton = IconTextButton()
        view.addSubview(addButton)

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: "Add new", image: UIImage(named: AssetIcon.icAdd)))

        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor, multiplier: 48 / 130, constant: 0),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
        addButton.configureStyle(cornerRadius: 22, borderWidth: 0, backgroundColor: UIColor(named: AssetColor.buttonBackgroundColor), textColor: .white)
        addButton.addTarget(self, action: #selector(onPressAddExpense), for: .touchUpInside)
    }

    @objc func onPressAddExpense() {
        let addExpenseViewController = AddExpenseViewController()
        addExpenseViewController.refreshHomeData = { [weak self] result in
            if result {
                self?.homeViewModel.loadApi()
                
                self?.bindData()
            }
            
        }
        navigationController?.pushViewController(addExpenseViewController, animated: true)
    }

    private func bindData() {
        expenseMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icPayment, value: String(-(homeViewModel.monthlyExpense)), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))

        balanceMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icWallet, value: String(homeViewModel.monthlyBalance), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))

        incomeMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icBank, value: String(homeViewModel.monthlyIncome), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
        
        historyTableView.loadData(viewData:  HistoryTableView.ViewData(listDailyStatistic: homeViewModel.monthlyStatistics  ))
    }

    private func configHistoryTableView() {
        

        historyTableView.bounces = false
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 300
        historyTableView.sizeToFit()
    }
}

extension HomeViewController : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is HomeViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}
