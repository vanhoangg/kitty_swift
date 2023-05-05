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
    
}
protocol MoneyStorageProtocol {
    func saveExpense(money:Money ,completion: (Bool) -> Void)
    func fetchMoney(completion: (Results<Money>?) -> Void)
}

struct StorageService  {
    let database = DataManager.instance.database
}
extension StorageService : MoneyStorageProtocol {
    func fetchMoney(completion: (Results<Money>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        
        let response = database.objects(Money.self).sorted(byKeyPath: "createAt", ascending: true)
        completion(response)
    }
    
    
    func saveExpense(money:Money ,completion: (Bool) -> Void){
        guard let database = database else {
            print("error: database is not found")
            return
        }
        do{
            // realm
            try database.write{
                database.add(money)
                completion(true)
                
            }
            
        } catch {
            completion(false)
        }
        
    }
}

extension StorageService : CategoryStorageProtocol {
    func fetchMediaCategory(completion: (Results<MediaCategory>?) -> Void){
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        let response = database.objects(MediaCategory.self)
        
        
        completion(response)
    }
    func fetchCategory(completion: (Results<Category>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        let response = database.objects(Category.self)
        
        
        completion(response)
    }
}
