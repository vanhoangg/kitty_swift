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

    @IBOutlet var icCalendarView: UIImageView!
    @IBOutlet var calendarView: UIView!
    @IBOutlet var homeStatStackView: UIStackView!
    @IBOutlet var historyTableView: HistoryTableView!
    @IBOutlet var expenseMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var incomeMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var balanceMonthlyReportView: ItemMonthlyReportView!
    @IBOutlet var datePickerLabel: UILabel!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        /// Build UI
        build()
        /// Configure
        bindData()
        /// Load Data
        homeViewModel.fetchListDataExpense()
    }

    // MARK: - Method

    private func build() {
        configureMonthlyReportView()
        configCalendarView()
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

    private func configCalendarView() {
        calendarView.cornerRadius = calendarView.frame.height * 0.375
        print(calendarView.frame.height)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapCalendarView))
        calendarView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
    }
    private func bindData() {
        datePickerLabel.text = homeViewModel.currentFilterDate?.toString(pattern: StringUtils.stringMonthYearPatternDate)
        homeViewModel.didLoadDataSuccess = { [weak self] monthlyHistory in
            self?.expenseMonthlyReportView.bind( value: String(-(monthlyHistory.monthlyExpense ?? 0)))
            self?.balanceMonthlyReportView.bind(value: String(monthlyHistory.monthlyBalance ?? 0) )
            self?.incomeMonthlyReportView.bind(value: String(monthlyHistory.monthlyIncome ?? 0))
            self?.historyTableView.loadData(viewData: HistoryTableView.ViewData(listDailyExpenseHistory: monthlyHistory.listDailyExpenseHistory))
            self?.reloadData()
        }
        homeViewModel.didloadDataFailed = { [weak self] error in
            self?.showErrorAlert(message: error.localizedDescription, title: "Back") {
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    private func reloadData() {
        self.historyTableView.reloadData()
    }

    // MARK: - Action

    @objc func onPressAddExpense() {
        let addExpenseViewController = AddExpenseViewController()
        addExpenseViewController.refreshHomeData = { [weak self] result in
            if result {
                self?.homeViewModel.fetchListDataExpense()
                self?.homeViewModel.setCurrentFilterDate(filterDate: Date())
                self?.bindData()
            }
        }
        addExpenseViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addExpenseViewController, animated: true)
    }

    @objc func onTapCalendarView() {
        let monthYearPicker = MonthYearPickerViewController()
        monthYearPicker.monthYearPickerViewModel.selectedMonth = homeViewModel.currentFilterDate?.toString(pattern: StringUtils.onlyMonthPatternDate).getMonthType()
        monthYearPicker.monthYearPickerViewModel.callback = { [self] selectedMonth in
            let filterDate: Date? = FunctionUtils.createDateFromMonth(monthRawValue: selectedMonth.rawValue)
            homeViewModel.setCurrentFilterDate(filterDate: filterDate)
            self.bindData()
        }
        monthYearPicker.modalPresentationStyle = .popover
        monthYearPicker.preferredContentSize = CGSize(width: screenWidth, height: screenWidth * 0.8)
        monthYearPicker.popoverPresentationController?.delegate = self
        monthYearPicker.popoverPresentationController?.sourceView = calendarView
        self.present(monthYearPicker, animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate

extension HomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let hide = (viewController is HomeViewController)
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension HomeViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.permittedArrowDirections = .unknown
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("Popover Dismissed!")
    }
}
