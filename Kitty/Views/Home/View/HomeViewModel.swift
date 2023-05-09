//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

protocol MonthlyStatisticProtocol {
    var monthlyHistory: MonthlyHistory? { get set }
    func loadApi()
}

protocol MonthPickerProtocol {
    var currentFilterDate: Date? { get set }
    func setCurrentFilterDate(filterDate: Date?)
}

class HomeViewModel: MonthlyStatisticProtocol, MonthPickerProtocol {
    let storageService: MoneyStorageProtocol
    var monthlyHistory: MonthlyHistory?
    var currentFilterDate: Date? = Date()
    init(service: MoneyStorageProtocol = StorageService()) {
        self.storageService = service
        loadApi()
    }
    
    func setCurrentFilterDate(filterDate: Date?) {
        currentFilterDate = filterDate
        loadApi()
    }
    
    func loadApi() {
        var monthlyExpense = 0.0
        var monthlyIncome = 0.0
        var monthlyBalance = 0.0
        var listMonthlyHistory: [Money]? = []
        var listMonthlyExpense: [Money]? = []
        var listDailyExpenseHistory: [DailyExpenseHistory]? = []
        guard let filterDate = currentFilterDate?.toString() else { return }
        storageService.fetchMoney {
            listMoney in
            /// Query table Money key : Month - Year
            listMonthlyHistory = listMoney?.filter { money in
                money.createAt?.contains(filterDate) ?? false
            }
            /// Query Data Money Type
            listMonthlyHistory?.forEach { moneyElement in
                if moneyElement.type == MoneyEnum.expense {
                    monthlyExpense += (moneyElement.value ?? 0)
                    listMonthlyExpense?.append(moneyElement)
                } else if moneyElement.type == MoneyEnum.income {
                    monthlyIncome += (moneyElement.value ?? 0)
                }
            }
            monthlyBalance = monthlyIncome - monthlyExpense
        }
        /// Create Dictionary to Group by createAt
        let dictionary = Dictionary(grouping: listMonthlyExpense ?? [], by: { $0.createAt })
        /// Convert Dictionary To Array
        dictionary.forEach { (key: String?, value: [Money]) in
            listDailyExpenseHistory?.append(DailyExpenseHistory(dayId: key, expenses: value))
        }
        monthlyHistory = MonthlyHistory(monthlyExpense: monthlyExpense, monthlyIncome: monthlyIncome, monthlyBalance: monthlyBalance, listDailyExpenseHistory: listDailyExpenseHistory)
    }
}
