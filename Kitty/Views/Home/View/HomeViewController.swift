//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    lazy var homeViewModel: MonthlyStatisticProtocol = {
        return HomeViewModel()
    }()
    
    // MARK: - IBoutlet
    
    @IBOutlet weak var icCalendarView: UIImageView!
    
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet var homeStatStackView: UIStackView!
    
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
        configCalendarView()
        configHistoryTableView()
        configFloatingButton()
        bindData()
    }
}



extension HomeViewController {
    // MARK: - Method
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
    private func bindData() {
        expenseMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icPayment, value: String(-(homeViewModel.monthlyHistory?.monthlyExpense ?? 0) ), title: "Expenses",valueColor: UIColor(named: AssetColor.red)))
        
        balanceMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icWallet, value: String(homeViewModel.monthlyHistory?.monthlyBalance ?? 0), title: "Balance",valueColor: UIColor(named: AssetColor.gray)))
        
        incomeMonthlyReportView.loadData(viewData: ItemMonthlyReportView.ViewData(icon: AssetIcon.icBank, value: String(homeViewModel.monthlyHistory?.monthlyIncome ?? 0), title: "Income",valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
        historyTableView.loadData(viewData:  HistoryTableView.ViewData(listDailyExpenseHistory: homeViewModel.monthlyHistory?.listDailyExpenseHistory))
        historyTableView.reloadData()
    }
    // MARK: Action
    @objc func onPressAddExpense() {
        let addExpenseViewController = AddExpenseViewController()
        addExpenseViewController.refreshHomeData = { [weak self] result in
            if result {
                self?.homeViewModel.loadApi()
                self?.homeViewModel.setCurrentFilterDate(filterDate: Date())
                
                self?.bindData()
            }
            
        }
        addExpenseViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addExpenseViewController, animated: true)
    }
    
    
    
    private func configHistoryTableView() {
        
        
        historyTableView.bounces = false
        //        historyTableView.rowHeight = UITableView.automaticDimension
        //        historyTableView.estimatedRowHeight = 200
        historyTableView.sizeToFit()
        
        
    }
    private func configCalendarView(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapCalendarView))
        calendarView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        
    }
    
    @objc func onTapCalendarView(){
        
        // Create your view controller
//        let monthYearPicker = UIViewController()
//
//        // Set background so that its visible
//        monthYearPicker.view.backgroundColor = .blue
        
        // Set your popover size.
        
        let monthYearPicker = MonthYearPickerViewController()
        monthYearPicker.modalPresentationStyle = .popover
        monthYearPicker.preferredContentSize = CGSize(width: screenWidth, height: screenWidth*0.8)
        monthYearPicker.popoverPresentationController?.delegate = self
        monthYearPicker.popoverPresentationController?.sourceView = calendarView
        self.present(monthYearPicker, animated: true, completion: nil)
        
    }
}

extension HomeViewController : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is HomeViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}
extension HomeViewController :UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        
        popoverPresentationController.permittedArrowDirections = .unknown
        
//        popoverPresentationController.barButtonItem = barPop
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("Popover Dismissed!")
    }
}
