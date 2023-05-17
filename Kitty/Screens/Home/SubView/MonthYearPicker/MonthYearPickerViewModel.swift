//
//  MonthYearPickerViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/8/23.
//

import Foundation
typealias CallBackSelectedMonth = (Months) -> Void

protocol MonthYearPickerProtocol {
    var listMonth: [Months] {get set}
    var selectedMonth: Months? {get set}
    var callback: CallBackSelectedMonth? {get set}

}
class MonthYearPickerViewModel: MonthYearPickerProtocol {
    var callback: CallBackSelectedMonth?

    var listMonth: [Months] = [Months.January, Months.February, Months.March, Months.April, Months.May, Months.June, Months.July, Months.August, Months.September, Months.October, Months.November, Months.December]

    var selectedMonth: Months?

}
