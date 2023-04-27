//
//  Expenses.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift

class Money: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
  
    @Persisted var category: Category?
    @Persisted var value: Double?
    @Persisted var valueDescription: String?
    @Persisted var type: MoneyEnum?
    
    
    @Persisted(originProperty: "dailyExpenses") var dailyExpenses: LinkingObjects<DailyStatistic>
    

    convenience init(description _: String? = "", category: Category?, value: Double?, type: MoneyEnum?)
    {
        self.init()
        self.dailyExpenses =  LinkingObjects(fromType: DailyStatistic.self, property: "dailyExpenses")
        
        
        self.value = value
        valueDescription = valueDescription
        if let category = category {
            self.category = category
        }
        self.type = type
    }
}

enum MoneyEnum: String, PersistableEnum {
    case balance
    case expense
    case income
}

extension MoneyEnum {
    var getTitle: String {
        switch self {
        case .balance:
            return "Balance"
        case .expense:
            return "Expense"
        case .income:
            return "Income"
        }
    }
    
}
extension String {
    var getMoneyEnum : MoneyEnum {
        switch self {
        case "Balance":
            return MoneyEnum.balance
        case "Expense":
            return MoneyEnum.expense
        case "Income":
            return MoneyEnum.income
        default:
            return MoneyEnum.expense
        }
        
    }
}
