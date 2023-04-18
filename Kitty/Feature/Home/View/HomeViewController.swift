//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewModel  = HomeViewModel()
    @IBOutlet weak var incomeStatView: ItemHomeStatView!
    @IBOutlet weak var balanceStatView: ItemHomeStatView!
    @IBOutlet weak var paymentStatView: ItemHomeStatView!
    @IBOutlet weak var homeStatStackView: UIStackView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
//        configCalendarView()
        configHomeStatView()
        buildExpenseTableView()
        
        
        // Do any additional setup after loading the view.
    }
}
extension HomeViewController {
    private func configHomeStatView(){
     
        paymentStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icPayment, value: "12000", title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
        
        balanceStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icWallet, value: "48000", title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
       
        incomeStatView.config(with: ItemHomeStatViewModel(icon: AssetIcon.icBank, value: "60000", title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func buildExpenseTableView(){
        
        let expenseTableView = ExpenseTableView()
        expenseTableView.items = homeViewModel.listItem
        
        print(" expenseTableView.rowHeight \(expenseTableView.sectionHeaderHeight)")
        print("count \(CGFloat(homeViewModel.listItem.count))")
        view.addSubview(expenseTableView)
        expenseTableView.translatesAutoresizingMaskIntoConstraints = false
        expenseTableView.backgroundColor = .systemBlue
        NSLayoutConstraint.activate([
            expenseTableView.topAnchor.constraint(equalTo: homeStatStackView.bottomAnchor,constant: 16),
            expenseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expenseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expenseTableView.heightAnchor.constraint(equalToConstant: (50 * CGFloat(homeViewModel.listItem.count)))
        ])
    }
}
