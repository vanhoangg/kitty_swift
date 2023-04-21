//
//  Money.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

struct DailyStatistic {
    let dayId,dayName:String
    
    let dailyIncome ,dailyBalance, dailyExpense :Float
    let listExpenseReport:[Expenses]
    
}
struct User{
    
    let userId,userName :String
    let listYearlyStatistic :[YearlyStatistic]
}
struct MonthlyStatistic{
    let monthId,monthName:String
    let monthlyIncome ,monthlyBalance,monthlyExpense :Float
    let listDailyStatistic: [DailyStatistic]
}
struct YearlyStatistic{
    let yearId, yearName:String
    let yearIncome ,yearBalance,yearExpense :Float
    let listMonthlyStatistic:[MonthlyStatistic]
}
struct Expenses{
    let category:ExpenseCategory
    let expenseValue :Float
    let expenseDescription:String?
    init(category: ExpenseCategory, expenseValue: Float, expenseDescription: String? = nil) {
        self.category = category
        self.expenseValue = expenseValue
        self.expenseDescription = expenseDescription
    }
}

struct ExpenseCategory{
    let categoryId,categoryName:String
}
extension ExpenseCategory {
    var iconUrl:String  {
        switch  categoryId {
        case "healthCategory":
            return AssetIcon.icHealth
        case "giftsCategory":
            return AssetIcon.icGift
        default:
            return AssetIcon.icHealth
        }
    }
    var colorBackground: String {
        switch  categoryId {
        case "healthCategory":
            return AssetColor.healthBackgroundColor
        case "giftsCategory":
            return AssetColor.giftBackgroundColor
        default:
            return AssetColor.transportationBackgroundColor
        }
    }
}



struct DummyData {
    static let healthCategory:ExpenseCategory = ExpenseCategory(categoryId: "healthCategory", categoryName: "Heath")
    static let giftsCategory:ExpenseCategory = ExpenseCategory(categoryId: "giftsCategory", categoryName: "Gifts")
    static let listExpense:[Expenses] =
    [
        Expenses(category: healthCategory, expenseValue: 150 , expenseDescription: "Hangouts with Sujay"),Expenses(category: giftsCategory, expenseValue: 100,expenseDescription: "Egg & veggies")
        
        
    ]
    static let listDailyStatistic:[DailyStatistic] =
    [
        DailyStatistic(dayId: "1/1/2023",dayName: "1", dailyIncome: 500, dailyBalance: 250, dailyExpense: 250, listExpenseReport: listExpense),
        DailyStatistic(dayId: "2/1/2023",dayName: "2", dailyIncome: 500, dailyBalance: 250, dailyExpense: 250, listExpenseReport: listExpense)
    ]
    static let listMonthlyStatistic:[MonthlyStatistic] =
    [
        MonthlyStatistic(monthId: "1/2023", monthName: "1", monthlyIncome: 1000, monthlyBalance: 500, monthlyExpense: 500, listDailyStatistic: listDailyStatistic),
        MonthlyStatistic(monthId: "2/2023", monthName: "2", monthlyIncome: 1000, monthlyBalance: 500, monthlyExpense: 500, listDailyStatistic: listDailyStatistic)
    ]
    static let listYearlyStatistic: [YearlyStatistic] = [YearlyStatistic(yearId: "2023", yearName: "2023", yearIncome: 4000, yearBalance: 2000, yearExpense: 2000, listMonthlyStatistic: listMonthlyStatistic)]
    static let user = User(userId: "userId1", userName: "UserName1", listYearlyStatistic: listYearlyStatistic)
    
}
