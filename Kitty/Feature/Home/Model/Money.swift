//
//  Money.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation
import RealmSwift

class DailyStatistic : Object {
    @Persisted(primaryKey: true) var id: String?

    
    @Persisted var dayName:String?
    
    convenience init(dayName: String?,dayId:String?) {
        self.init()
        self.dayName = dayName
        self.id = dayId
    }
}
class  User :Object{
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var userName :String?
    
    convenience init(userName:String?)
    {
        self.init()
        self.userName = userName
    }
}

class MonthlyStatistic : Object{
    @Persisted(primaryKey: true) var id: String?

    @Persisted var yearId:String?
    @Persisted var  monthName:String?
    convenience init(yearId:String?,monthName:String?,id:String?)
    {
        self.init()
        self.id = self.id
        self.monthName = monthName
        self.yearId = yearId
        
        
    }
    
}

class  Expenses : Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var yearId:String?
    @Persisted var monthId:String?
    @Persisted var dayId:String?
    @Persisted var category:ExpenseCategory? = ExpenseCategory()
    @Persisted var expenseValue :Float?
    @Persisted var expenseDescription:String?
    convenience init(expenseDescription:String? = "" ,category:ExpenseCategory?,expenseValue:Float?,yearId:String?,monthId:String?,dayId:String?)
    {
        self.init()
        self.dayId = dayId
        self.monthId = monthId
        self.yearId = yearId
        self.expenseValue = expenseValue
        self.expenseDescription = expenseDescription
        if let category = category {
            self.category = category
        }
    }
}





struct DummyData {
    static let listCategory: [ExpenseCategory] = [ExpenseCategory(categoryName: "Gift", type: CategoryEnum.gifts),ExpenseCategory(categoryName: "Health", type: CategoryEnum.health)]
    
}
