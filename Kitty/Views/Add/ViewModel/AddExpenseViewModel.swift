//
//  AddExpenseViewModel.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
protocol UpdateExpenseInfomationProtocol{
    func setChoosenCategory(choosenCategory: Category?)
    func setChoosenCategory(type: MoneyEnum?)
    func setAmountValue(value: Double?)
    func setDescriptionAmount(description: String?)
    func saveExpense(completion: (Bool) -> Void)
    var choosenCategory: Category? {get set}
    var choosenMoneyType: MoneyEnum? {get set}
    var amountValue: Double? {get set}
    var descriptionAmount: String? {get set}
}
class AddExpenseViewModel :UpdateExpenseInfomationProtocol{
    var choosenCategory: Category?
    var choosenMoneyType: MoneyEnum? = MoneyEnum.expense
    var amountValue: Double?
    var descriptionAmount: String?
    
    let storageServices:StorageServiceProtocol
    
    
    init(services:StorageServiceProtocol = StorageService.init()){
        self.storageServices = services
    }
    
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
        storageServices.saveExpense(money: money,completion:completion)
    }
}
