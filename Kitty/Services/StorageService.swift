//
//  StorageService.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import Foundation

import RealmSwift
protocol CategoryStorageProtocol {
    func fetchCategory(completion: (Results<Category>?) -> Void)
    func fetchMediaCategory(completion: (Results<MediaCategory>?) -> Void)
    func createNewCategory(category: Category, completion: (Bool) -> Void)

}
protocol MoneyStorageProtocol {
    func saveExpense(money: Money, completion: (Bool) -> Void)
    func fetchMoney(completion: (Results<Money>?) -> Void)
}

struct StorageService {
    let database = DataManager.instance.database
}
extension StorageService: MoneyStorageProtocol {
    func fetchMoney(completion: (Results<Money>?) -> Void) {
        let response = database.objects(Money.self).sorted(byKeyPath: "createAt", ascending: true)
        return completion(response)
    }

    func saveExpense(money: Money, completion: (Bool) -> Void) {
        do {
            try database.write {
                database.add(money)
                return completion(true)
            }
        } catch {
            return completion(false)
        }

    }
}

extension StorageService: CategoryStorageProtocol {
    func fetchMediaCategory(completion: (Results<MediaCategory>?) -> Void) {
        let response = database.objects(MediaCategory.self)

        return completion(response)
    }
    func fetchCategory(completion: (Results<Category>?) -> Void) {
        let response = database.objects(Category.self)

        return completion(response)
    }
    func createNewCategory(category: Category, completion: (Bool) -> Void) {
        do {
            try database.write {
                database.add(category)
               return completion(true)
            }

        } catch {
            return completion(false)
        }

    }
}
