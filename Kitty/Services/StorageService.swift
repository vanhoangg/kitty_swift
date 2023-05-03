//
//  StorageService.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import Foundation

import RealmSwift
protocol StorageServiceProtocol {
    func fetchCategory(completion: (Results<Category>?) -> Void)
    func saveExpense(money:Money ,completion: (Bool) -> Void)
}

class StorageService : StorageServiceProtocol {
    
    
    let database = DataManager.instance.database
    func fetchCategory(completion: (Results<Category>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        let response = database.objects(Category.self)
        print(response)

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


