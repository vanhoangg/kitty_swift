//
//  StorageService.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import Foundation

import RealmSwift
protocol CategoryStorageProtocol {
    func fetchCategory(success: (([Category]) -> Void)?, failure: ((Error) -> Void)?)
    func fetchMediaCategory(success: (([MediaCategory]) -> Void)?, failure: ((Error) -> Void)?)
    func createNewCategory(category: Category, success: (() -> Void)?, failure: ((Error) -> Void)?)
}
protocol MoneyStorageProtocol {
    func saveExpense(money: Money, success: (() -> Void)?, failure: ((Error) -> Void)?)
    func fetchMoney(success: (([Money]) -> Void)?, failure: ((Error) -> Void)?)
}

struct StorageService: MoneyStorageProtocol {
    let dataManager: IDataManager = {
        return DataManager.sharedInstance
    }()

    func fetchMoney(success: (([Money]) -> Void)?, failure: ((Error) -> Void)?) {
        dataManager.getRecord { (listData: Results<Money>)  in
            success?(listData.toArray(ofType: Money.self))
        } failure: { error in
            failure?(error)
        }
    }
    func saveExpense(money: Money, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        dataManager.saveRecord(record: money) {
            success?()
        } failure: { error in
            failure?( error)
        }
    }
}

extension StorageService: CategoryStorageProtocol {
    func fetchMediaCategory(success: (([MediaCategory]) -> Void)?, failure: ((Error) -> Void)?) {
        dataManager.getRecord { (listData: Results<MediaCategory>) in
            let results = listData.distinct(by: ["iconUrl"]).toArray(ofType: MediaCategory.self)
            success?(results)
        } failure: { error in
            failure?(error)
        }
    }
    func fetchCategory(success: (([Category]) -> Void)?, failure: ((Error) -> Void)?) {
        dataManager.getRecord { (listData: Results<Category>) in
            let results = listData.toArray(ofType: Category.self)
            success?(results)
        } failure: { error in
            failure?(error)
        }
    }
    func createNewCategory(category: Category, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        dataManager.saveRecord(record: category) {
            success?()
        } failure: { error in
            failure?( error)
        }
    }
}
