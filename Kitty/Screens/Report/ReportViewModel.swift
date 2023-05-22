//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation

protocol MonthlyReportProtocol {
    var filterDate: Date? { get }
    func setCurrentFilterDate(filterDate: Date?)
    func getPickerDate()
}
class ReportViewModel: MonthlyReportProtocol {

    var filterDate: Date?

 
     func getPickerDate() {
         return self.filterDate = UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
    }
    func setCurrentFilterDate(filterDate: Date?) {
        

        UserDefaultsHelper.setData(value: filterDate, key: .pickerDate)
        

        self.filterDate = filterDate
//        fetchListDataExpense()
    }
}
