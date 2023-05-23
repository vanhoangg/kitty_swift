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
    case balance = "BALANCE"
    case expense = "EXPENSE"
    case income = "INCOME"
}
extension String {
    var getMoneyEnum: MoneyEnum {
        switch self {
        case MoneyEnum.RawValue("BALANCE"):
            return MoneyEnum.balance
        case MoneyEnum.RawValue("EXPENSE"):
            return MoneyEnum.expense
        case MoneyEnum.RawValue("INCOME"):
            return MoneyEnum.income
        default:
            return MoneyEnum.expense
        }
    }
}
