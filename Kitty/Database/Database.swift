//
//  Database.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import Foundation
import RealmSwift
struct DummyData {
    static let listCategory: [Category] = [Category(categoryName: "Gift", iconUrl: AssetIcon.icHealth,backgroundColor: AssetColor.healthBackgroundColor), Category(categoryName: "Health", iconUrl: AssetIcon.icGift,backgroundColor: AssetColor.giftBackgroundColor)]
}

final class DataManager {
    static let instance: DataManager = {
        let dataManager = DataManager()
        let database = try! Realm()
        // config
        dataManager.configDatabase(realm: database)
        print(database.configuration.fileURL ?? "")
        
        return dataManager
    }()

    
    

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
        
        let response = database.objects(Money.self).sorted(byKeyPath: "createAt", ascending: true)
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


