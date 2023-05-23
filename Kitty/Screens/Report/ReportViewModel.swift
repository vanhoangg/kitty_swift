//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation
import RealmSwift

protocol MonthlyReportProtocol {
    var currentFilterDate: Date? { get }
    func setCurrentFilterDate(filterDate: Date?)
    func getPickerDate()
}
class ReportViewModel: MonthlyReportProtocol {
    let storageService: MoneyStorageProtocol
    var currentFilterDate: Date?
    init(service: MoneyStorageProtocol = StorageService()) {
        self.storageService = service
    }
     func getPickerDate() {
          self.currentFilterDate = UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
         fetchListDataExpense()
    }
    func setCurrentFilterDate(filterDate: Date?) {

        UserDefaultsHelper.setData(value: filterDate, key: .pickerDate)
        self.currentFilterDate = filterDate
        fetchListDataExpense()
    }
    func fetchListDataExpense() {
        var monthlyExpense = 0.0

        var listMonthlyHistory: [Money] = []
        var listMonthlyExpense: [Money] = []
        var listDailyExpenseHistory: [DailyExpenseHistory] = []
        guard let filterDate = self.currentFilterDate?.toString(pattern: StringUtils.numMonthYearPatternDate) else { return }
        storageService.fetchMoney(success: { listMoney in
            listMonthlyHistory = listMoney.filter { money in
                money.createAt?.contains(filterDate) ?? false
            }

            /// Query Data Money Type
            listMonthlyHistory.forEach { moneyElement in
                Log.d("moneyElement.Type \(moneyElement.type)")

                if moneyElement.type == MoneyEnum.expense {
                    monthlyExpense += (moneyElement.value ?? 0)
                    listMonthlyExpense.append(moneyElement)
                }
            }
            let dictionary = Dictionary(grouping: listMonthlyExpense, by: { $0.category })

            /// Convert Dictionary To Array
            dictionary.forEach { (_: Category?, _: [Money]) in
            }

//            self.didLoadDataSuccess?(monthlyHistory)
        }, failure: { _ in
//            self.didloadDataFailed?(error)
        })

    }
}
