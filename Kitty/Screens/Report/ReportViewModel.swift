//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation

protocol MonthlyReportProtocol {
    func getPickerDate() -> Void
    var datePickerText: Date? { get }
}
class ReportViewModel: MonthlyReportProtocol {
    
    var datePickerText: Date?
    
    
    init() {
        getPickerDate()
    }
     func getPickerDate() -> Void {
         return datePickerText = UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
    }
    func setCurrentFilterDate(filterDate: Date?) {
        UserDefaultsHelper.setData(value: filterDate, key: .pickerDate)
        currentFilterDate = filterDate
        fetchListDataExpense()
    }
}
