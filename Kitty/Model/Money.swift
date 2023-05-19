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
    @Persisted var createAt: String?

}

enum MoneyEnum: String, PersistableEnum {
    case balance = "Balance"
    case expense = "Expense"
    case income = "Income"
}
extension String {
    var getMoneyEnum: MoneyEnum {
        switch self {
        case MoneyEnum.RawValue("Balance"):
            return MoneyEnum.balance
        case MoneyEnum.RawValue("Expense"):
            return MoneyEnum.expense
        case MoneyEnum.RawValue("Income"):
            return MoneyEnum.income
        default:
            return MoneyEnum.expense
        }
    }
}
