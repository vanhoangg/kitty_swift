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
        print(database.configuration.fileURL ?? "")
        
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
    func fetchData(completion: (Results<Money>?) -> Void) {
        // realm
        guard let database = database else {
            print("error: database is not found")
            return
        }
        
        let response = database.objects(Money.self)
        completion(response)
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


