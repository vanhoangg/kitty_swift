//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation


protocol MonthlyStatisticProtocol {
    var monthlyStatistics: [Money]? { get set }
    var refreshData: (()-> ())? { get set }
    var monthlyExpense:Double {get set}
    var monthlyIncome:Double {get set}
    var monthlyBalance:Double {get set}
    func initData()
    func loadApi()
}
class HomeViewModel :MonthlyStatisticProtocol{
    var monthlyStatistics: [Money]?
    
    var refreshData: (() -> ())?
    
    var monthlyExpense: Double = 0.0
    
    var monthlyIncome: Double = 0.0
    
    var monthlyBalance: Double = 0.0
    
    init(){
        loadApi()
    }
    
    func initData(){
        monthlyIncome = 0
        monthlyExpense = 0
        monthlyBalance = 0
    }
    
    func loadApi() {
        initData()
//        DataManager.instance().save()
        DataManager.instance().fetchData {
            listMoney in
//            monthlyStatistics =   listMoney?.filter({ money in
//                return  (money.createAt?.contains("2023") ?? false) && (money.createAt?.contains("April") ?? false)
//            })
            monthlyStatistics?.forEach({ moneyElement in
                
                if(moneyElement.type == MoneyEnum.expense){
                    monthlyExpense += ( moneyElement.value ?? 0 )
                } else if(moneyElement.type == MoneyEnum.income)
                {
                    monthlyIncome +=  (moneyElement.value ?? 0)
                }
            })
            monthlyBalance = monthlyExpense  - monthlyIncome
        }
     
    }
}
