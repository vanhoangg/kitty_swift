//
//  Expenses.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift

class  Money : Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var yearId:String?
    @Persisted var monthId:String?
    @Persisted var dayId:String?
    @Persisted var category:Category?
    @Persisted var value :Float?
    @Persisted var valueDescription:String?
    @Persisted var type:MoneyEnum?
    convenience init(description:String? = "" ,category:Category?,value:Float?,yearId:String?,monthId:String?,dayId:String?,type:MoneyEnum?)
    {
        self.init()
        self.dayId = dayId
        self.monthId = monthId
        self.yearId = yearId
        self.value = value
        self.valueDescription = valueDescription
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
    var getTitle:String  {
        switch  self {
        case.balance:
            return "Balance"
        case .expense:
            return "Expense"
        case .income:
            return "Expense"
            
        }
    }
}
