//
//  StorageService.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import Foundation

import RealmSwift
protocol CategoryStorageProtocol {
    func fetchCategory(completion: (Result<Results<Category>, Error>) -> Void)
    func fetchMediaCategory(completion: (Result<Results<MediaCategory>, Error>) -> Void)
    func createNewCategory(category: Category, completion: (Bool, Error) -> Void)
}
protocol MoneyStorageProtocol {
    func saveExpense(money: Money, completion: (Bool, Error) -> Void)
    func fetchMoney(completion: (Result<Results<Money>, Error>) -> Void)
}

struct StorageService: MoneyStorageProtocol {
    let realm = DataManager.instance.database
    func fetchMoney(completion: (Result<Results<Money>, Error>) -> Void) {
        if let results = realm?.objects(Money.self).sorted(byKeyPath: "createAt", ascending: true) {
            completion(.success(results))
        } else {
            completion(.failure(KTError.errorDataNotExist))
        }
    }
    func saveExpense(money: Money, completion: (Bool, Error) -> Void) {
        do {
            try realm?.write {
                realm?.add(money)
                return completion(true, KTError.errorUnknown)
            }
        } catch let error {
            return completion(false, error)
        }
    }
}

extension StorageService: CategoryStorageProtocol {
    func fetchMediaCategory(completion: (Result<Results<MediaCategory>, Error>) -> Void) {
        if let results = realm?.objects(MediaCategory.self).distinct(by: ["iconUrl"]) {
            return completion(.success(results))
        } else {
            return completion(.failure(KTError.errorDataNotExist))
        }
    }
    func fetchCategory(completion: (Result<Results<Category>, Error>) -> Void) {
        if let results = realm?.objects(Category.self) {
            return completion(.success(results))
        } else {
            return completion(.failure(KTError.errorDataNotExist))
        }
    }
    func createNewCategory(category: Category, completion: (Bool, Error) -> Void) {

        do {
            try realm?.write {
                realm?.add(category)
                return completion(true, KTError.errorUnknown)
            }
        } catch let error {
            return completion(false, error)
        }
    }
}
