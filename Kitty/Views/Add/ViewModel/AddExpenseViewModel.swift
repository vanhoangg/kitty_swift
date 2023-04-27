//
//  AddExpenseViewModel.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation

class AddExpenseViewModel {
    @Published var choosenCategory: Category? 
    @Published var choosenMoneyType: MoneyEnum? = MoneyEnum.expense
    @Published var amountValue: Double?
    @Published var descriptionAmount: String?
    
    func setChoosenCategory(choosenCategory: Category?) {
        self.choosenCategory = choosenCategory
    }
    func setChoosenCategory(type: MoneyEnum?) {
        self.choosenMoneyType = type
    }
    func setAmountValue(value: Double?) {
        self.amountValue = value
    }
    func setDescriptionAmount(description: String?) {
        self.descriptionAmount = description
    }
    func saveExpense(completion: (Bool) -> Void){
        let currentDate = Date()
        print("descriptionAmount == \(descriptionAmount)")
        print("choosenCategory == \(choosenCategory)")
        print("choosenMoneyType == \(choosenMoneyType)")
        print("amountValue == \(amountValue)")
        
        let money = Money(description: descriptionAmount, category: choosenCategory, value: amountValue, type: choosenMoneyType)
        DataManager.instance().saveExpense(money: money,completion:completion)
    }
}
