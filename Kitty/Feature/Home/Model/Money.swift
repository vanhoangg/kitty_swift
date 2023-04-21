//
//  Money.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

struct StatisticDay {
    let dayId,dayName:String
    
    let dayIncome ,dayBalance,dayExpense :Float
    let expenses:[Expenses]
    
}
struct User{
    
    let userId,userName :String
    let listStatisticYear :[StatisticYear]
}
struct StatisticMonth{
    let monthId,monthName:String
    let monthIncome ,monthBalance,monthExpense :Float
    let listStatisticDay: [StatisticDay]
}
struct StatisticYear{
    let yearId, yearName:String
    let yearIncome ,yearBalance,yearExpense :Float
    let listStatisticMonth:[StatisticMonth]
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



struct DummyData {
    static let healthCategory:ExpenseCategory = ExpenseCategory(categoryId: "category1", categoryName: "Heath")
    static let giftsCategory:ExpenseCategory = ExpenseCategory(categoryId: "category2", categoryName: "Gifts")
    static let listExpense:[Expenses] =
    [
        Expenses(category: healthCategory, expenseValue: 150),Expenses(category: giftsCategory, expenseValue: 100)
        

    ]
    static let listStatisticDay:[StatisticDay] =
    [
        StatisticDay(dayId: "1/1/2023",dayName: "1", dayIncome: 500, dayBalance: 250, dayExpense: 250, expenses: listExpense),
        StatisticDay(dayId: "2/1/2023",dayName: "2", dayIncome: 500, dayBalance: 250, dayExpense: 250, expenses: listExpense)
    ]
    static let listMonthlyStatistic:[StatisticMonth] =
    [
        StatisticMonth(monthId: "1/2023", monthName: "1", monthIncome: 1000, monthBalance: 500, monthExpense: 500, listStatisticDay: listStatisticDay),
        StatisticMonth(monthId: "2/2023", monthName: "2", monthIncome: 1000, monthBalance: 500, monthExpense: 500, listStatisticDay: listStatisticDay)
    ]
    static let listStatisticYear: [StatisticYear] = [StatisticYear(yearId: "2023", yearName: "2023", yearIncome: 4000, yearBalance: 2000, yearExpense: 2000, listStatisticMonth: listMonthlyStatistic)]
    static let user = User(userId: "userId1", userName: "UserName1", listStatisticYear: listStatisticYear)
    
}
