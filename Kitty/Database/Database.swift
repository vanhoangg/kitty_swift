//
//  Database.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import Foundation
import RealmSwift
struct DummyData {
    static let listCategory: [Category] = [Category(categoryName: "Gift", type: CategoryEnum.gifts), Category(categoryName: "Health", type: CategoryEnum.health)]
}

final class DataManager {
    private static var dataManager: DataManager = {
        let dataManager = DataManager()
        let database = try! Realm()
        // config
        dataManager.configDatabase(realm: database)

        return dataManager
    }()

    class func instance() -> DataManager {
        return dataManager
    }

    // properties
    var database: Realm?

    // init
    private init() {}

    // config database
    func configDatabase(realm: Realm) {
        database = realm
    }

    // open database

    func fetchCategory(completion: (Results<Category>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        let response = database.objects(Category.self).distinct(by: ["type"])
        print(response)

        completion(response)
    }
    func fetchData(completion: (Results<Money>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        print(database.configuration.fileURL)
        let response = database.objects(Money.self)
        completion(response)
    }
    func testFilter(){
        guard let database = database else {
            print("error: database is not found")
            return
        }
        
        let movies = database.objects(Money.self).distinct(by: ["createAt"])
        print(movies)
    }
    


    // save database
    func save() {
        guard let database = database else {
            print("error: database is not found")
            return
        }
        try! database.write {
            database.add(DummyData.listCategory)
        }
    }
}
extension DataManager{
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
                database.cancelWrite()
            }
            
        } catch {
                completion(false)
            }
        
        }
    
    
}

