//
//  MonthlyHistory.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 28/04/2023.
//

import Foundation

struct MonthlyHistory {
    var monthlyExpense:Double?
    var monthlyIncome:Double?
    var monthlyBalance:Double?
    let listDailyExpenseHistory :[DailyExpenseHistory]?
    
}
struct DailyExpenseHistory{
    let dayId:String?
    let expenses :[Money]?
    init(dayId:String?,expenses:[Money]?){
        self.dayId = dayId
        self.expenses = expenses
    }
}
