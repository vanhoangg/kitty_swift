//
//  AddExpenseViewModel.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
protocol UpdateExpenseInfomationProtocol {
    func setChoosenCategory(choosenCategory: Category?)
    func setMoneyType(type: MoneyEnum?)
    func setAmountValue(value: Double?)
    func setDescriptionAmount(description: String?)
    func saveExpense(success: (() -> Void)?, failure: ((Error) -> Void)?)
    var choosenCategory: Category? {get set}
    var choosenMoneyType: MoneyEnum? {get set}
    var amountValue: Double? {get set}
    var descriptionAmount: String? {get set}

}

class AddExpenseViewModel: UpdateExpenseInfomationProtocol {
    var didSuccessAddMoneyRecord: (() -> Void)?

    var didFailureAddMoneyRecord: ((Error) -> Void)?

    var choosenCategory: Category?
    var choosenMoneyType: MoneyEnum? = MoneyEnum.expense
    var amountValue: Double?
    var descriptionAmount: String?

    let storageServices: MoneyStorageProtocol

    init(services: MoneyStorageProtocol = StorageService.init()) {
        self.storageServices = services
    }

    func setChoosenCategory(choosenCategory: Category?) {
        self.choosenCategory = choosenCategory
    }
    func setMoneyType(type: MoneyEnum?) {
        self.choosenMoneyType = type
    }
    func setAmountValue(value: Double?) {
        self.amountValue = value
    }
    func setDescriptionAmount(description: String?) {
        self.descriptionAmount = description
    }
    func saveExpense(success: (() -> Void)?, failure: ((Error) -> Void)?) {
        let currentDate = Date()
        let money = Money()
        money.valueDescription = descriptionAmount
        money.category = choosenCategory
        money.value = amountValue
        money.type = choosenMoneyType
        money.createAt = currentDate.toString()
        storageServices.saveExpense(money: money, success: {
            success?()
        }, failure: { error in
            failure?(error)
        })
    }
}
