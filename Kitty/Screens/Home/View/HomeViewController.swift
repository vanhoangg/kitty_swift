//
//  HomeViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeViewModel: MonthlyStatisticProtocol & MonthPickerProtocol = {
        return HomeViewModel()
    }()

    // MARK: - IBoutlet

    @IBOutlet weak var customHeaderView: CustomHeaderView!
    @IBOutlet var homeStatStackView: UIStackView!
    @IBOutlet var historyTableView: HistoryTableView!
    @IBOutlet var expenseMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var incomeMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var balanceMonthlyReportView: ItemMonthlyReportView!
    private lazy var loadingView: UIAlertController = {
        return LoadingViewController(title: nil, message: "Please wait...", preferredStyle: .alert)
    }()
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        homeViewModel.getCurrentFilterDate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        /// Build UI
        build()
        bindData()

    }
    // MARK: - Method
    private func showLoadingView() {
        present(loadingView, animated: true, completion: nil)
    }
    private func dismissLoadingView() {
        dismiss(animated: false, completion: nil)
    }
    private func build() {
        configureMonthlyReportView()
        configHistoryTableView()
        configFloatingButton()
    }
}

extension HomeViewController {
    private func configureMonthlyReportView() {
        self.expenseMonthlyReportView.configure(ItemMonthlyReportView.ViewData(icon: AssetIcon.icPayment, title: "Expenses", valueColor: UIColor(named: AssetColor.red)))
        self.balanceMonthlyReportView.configure(ItemMonthlyReportView.ViewData(icon: AssetIcon.icWallet, title: "Balance", valueColor: UIColor(named: AssetColor.gray)))
        self.incomeMonthlyReportView.configure(ItemMonthlyReportView.ViewData(icon: AssetIcon.icBank, title: "Income", valueColor: UIColor(named: AssetColor.PrimaryTextColor)))
    }
    private func configFloatingButton() {
        let addButton = IconTextButton()
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: "Add new", image: UIImage(named: AssetIcon.icAdd)))
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor, multiplier: 48 / 130, constant: 0),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
        addButton.configureStyle(cornerRadius: 22, borderWidth: 0, backgroundColor: UIColor(named: AssetColor.buttonBackgroundColor), textColor: .white)
        addButton.addTarget(self, action: #selector(onPressAddExpense), for: .touchUpInside)
    }

    private func configHistoryTableView() {
        historyTableView.bounces = false
        historyTableView.sizeToFit()
    }
    private func bindData() {
    
        homeViewModel.didLoadingData = {
            self.showLoadingView()
        }
        homeViewModel.didLoadDataSuccess = { [weak self] monthlyHistory in
            DispatchQueue.main.async {
                self?.dismissLoadingView()
         
                self?.expenseMonthlyReportView.bind( value: String(-(monthlyHistory.monthlyExpense ?? 0)))
                self?.balanceMonthlyReportView.bind(value: String(monthlyHistory.monthlyBalance ?? 0) )
                self?.incomeMonthlyReportView.bind(value: String(monthlyHistory.monthlyIncome ?? 0))
                self?.historyTableView.loadData(viewData: HistoryTableView.ViewData(listDailyExpenseHistory: monthlyHistory.listDailyExpenseHistory))
                self?.reloadData()
            }
        }
        homeViewModel.didloadDataFailed = { [weak self] error in
            DispatchQueue.main.async {
                self?.dismissLoadingView()
                self?.showErrorAlert(message: error.localizedDescription, title: "Back") {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    private func reloadData() {
        self.historyTableView.reloadData()
        self.customHeaderView.configureData(CustomHeaderView.ViewData(onTapGestureDetecture: { monthYearPickerViewController in
            self.onTapCalendarView(monthYearPickerViewController)
        }, datePicker: self.homeViewModel.currentFilterDate))
    }
    private func reloadDataAfterUpdateFilterDate(filterDate: Date?) {
        self.homeViewModel.setCurrentFilterDate(filterDate: filterDate)
    }

    // MARK: - Action

    @objc func onPressAddExpense() {
        let addExpenseViewController = AddExpenseViewController()
        addExpenseViewController.refreshHomeData = { [weak self] result in
            if result {
                self?.reloadDataAfterUpdateFilterDate(filterDate: Date())
            }
        }
        addExpenseViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addExpenseViewController, animated: true)
    }

    private func onTapCalendarView(_ monthYearPickerViewController: MonthYearPickerViewController) {
        self.present(monthYearPickerViewController, animated: true, completion: nil)
        monthYearPickerViewController.monthYearPickerViewModel.selectedMonth = homeViewModel.currentFilterDate?.toString(pattern: StringUtils.onlyMonthPatternDate).getMonthType()
        monthYearPickerViewController.monthYearPickerViewModel.callback = { [self] selectedMonth in
            let filterDate: Date? = FunctionUtils.createDateFromMonth(monthRawValue: selectedMonth.rawValue)
            homeViewModel.setCurrentFilterDate(filterDate: filterDate)
        }
    }
}

// MARK: - UINavigationControllerDelegate

extension HomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is HomeViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}
