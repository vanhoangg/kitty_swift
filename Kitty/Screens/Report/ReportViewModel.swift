//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation

protocol MonthlyReportProtocol {
    func getPickerDate() -> Date?
}
class ReportViewModel: MonthlyReportProtocol {

    init() {

    }
     func getPickerDate() -> Date? {
        return UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
    }

}
