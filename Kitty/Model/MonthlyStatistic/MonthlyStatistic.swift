//
//  MonthlyStatistic.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift

class MonthlyStatistic :Object {
    @Persisted var monthlyExpense:Double?
    @Persisted var monthlyIncome:Double?
    @Persisted var monthlyBalance:Double?
    
    @Persisted var dailyExpenses: List<DailyStatistic>
    
}
