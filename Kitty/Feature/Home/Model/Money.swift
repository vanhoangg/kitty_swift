//
//  Money.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation
import RealmSwift

class DailyStatistic : Object {
    @Persisted(primaryKey: true) var _id: ObjectId

    
    @Persisted var dayName:String?
    
    @Persisted var dailyExpense:Float?
    @Persisted var listExpenseReport:List<Expenses> = List<Expenses>()
    
    
    
    
    convenience init(dayName: String?,expenseReports:[Expenses]?) {
        self.init()
    
        self.dayName = dayName

        
        if let expenseReports = expenseReports {
            var sum:Float = 0;
            for expense in expenseReports {
                 sum = sum + (expense.expenseValue ?? 0)
            }
            self.dailyExpense = sum
            self.listExpenseReport.append(objectsIn: expenseReports)
        }
     
        
    }
}
class  User :Object{
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var userName :String?
    @Persisted var  listMonthlyStatistic = List<MonthlyStatistic>()
    convenience init(userName:String?,monthlyStatistics:[MonthlyStatistic]?)
    {
        self.init()
        self.userName = userName
        if let monthlyStatistics = monthlyStatistics {
            self.listMonthlyStatistic.append(objectsIn:monthlyStatistics)
        }
        
    }
}

class MonthlyStatistic : Object{
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var yearName:String?
    @Persisted var  monthName:String?
    @Persisted var  monthlyIncome:Float?
    @Persisted var  monthlyBalance:Float?
    @Persisted var  monthlyExpense:Float?
    @Persisted var  listDailyStatistic: List<DailyStatistic> = List<DailyStatistic>()
    convenience init(yearName:String?,monthName:String?,monthlyIncome:Float?,dailyStatistics:[DailyStatistic]?)
    {
        self.init()
        
        self.monthName = monthName
        self.monthlyIncome = monthlyIncome
        self.yearName = yearName
        if let dailyStatistics = dailyStatistics {
            self.listDailyStatistic.append(objectsIn: dailyStatistics)
            var sum:Float = 0
             dailyStatistics.forEach({ dailyStatistic in
                 
                 sum = sum + (dailyStatistic.dailyExpense ?? 0)
            })
            
            self.monthlyExpense = sum
            self.monthlyBalance = (monthlyIncome ?? 0) - sum
        }
        
    }
    
}

class  Expenses : Object {
    @Persisted(primaryKey: true) var _id: ObjectId

    
    
    @Persisted var category:ExpenseCategory? = ExpenseCategory()
    @Persisted var expenseValue :Float?
    @Persisted var expenseDescription:String?
    convenience init(expenseDescription:String? = "" ,category:ExpenseCategory?,expenseValue:Float?)
    {
        self.init()
        self.expenseValue = expenseValue
        self.expenseDescription = expenseDescription
        if let category = category {
            self.category = category
        }
    }
}

class ExpenseCategory :Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var categoryName:String?
    @Persisted var type:CategoryEnum = CategoryEnum.unknow
    convenience init(categoryName:String? = "" ,type:CategoryEnum?)
    {
        self.init()
        self.categoryName = categoryName
        
        if let type = type {
            self.type = type
        }
    }
    
}
enum CategoryEnum: String, PersistableEnum {
    case health
    case gifts
    case unknow
}
extension ExpenseCategory {
    var iconUrl:String  {
        switch  type {
        case CategoryEnum.health:
            return AssetIcon.icHealth
        case CategoryEnum.gifts:
            return AssetIcon.icGift
        default:
            return AssetIcon.icHealth
        }
    }
    var colorBackground: String {
        switch  type {
        case CategoryEnum.health:
            return AssetColor.healthBackgroundColor
        case CategoryEnum.gifts:
            return AssetColor.giftBackgroundColor
        default:
            return AssetColor.transportationBackgroundColor
        }
    }
}



struct DummyData {
    static let healthCategory:ExpenseCategory = ExpenseCategory(categoryName: "Heath", type: CategoryEnum.health)
    static let giftsCategory:ExpenseCategory = ExpenseCategory(categoryName: "Gifts", type: CategoryEnum.gifts)
    static let listExpense:[Expenses] =
                                                                        [ Expenses(expenseDescription: "Hangouts with Sujay", category: healthCategory, expenseValue: 150),
                                                                          Expenses(expenseDescription: "Egg & veggies", category: giftsCategory, expenseValue: 100)]
    
    static let listDailyStatistic:[DailyStatistic] =
    [
        DailyStatistic(dayName: "1/1/2023", expenseReports: listExpense),
        DailyStatistic(dayName: "2/1/2023",  expenseReports: listExpense)
    ]
    static let listMonthlyStatistic:[MonthlyStatistic] =
    [
        MonthlyStatistic(yearName: "2023",monthName: "1/2023", monthlyIncome: 1000,  dailyStatistics: listDailyStatistic),
        MonthlyStatistic(yearName: "2023",monthName: "2/2023", monthlyIncome: 1000,  dailyStatistics: listDailyStatistic)
    ]
    
    static let user = User(userName: "UserName1", monthlyStatistics: listMonthlyStatistic)
    
}
