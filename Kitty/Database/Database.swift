//
//  Database.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import Foundation
import RealmSwift
final class DataManager {
    private static var dataManager: DataManager = {
          let dataManager = DataManager()
          let database = try! Realm()
          //config
          dataManager.configDatabase(realm: database)
          
          return dataManager
      }()
      
      class func instance() -> DataManager {
          return dataManager
      }
      
      //properties
    var database: Realm?;
      
      // init
      private init() {
          
      }
      
      // config database
      func configDatabase(realm: Realm) {
          self.database = realm
      }
      
      //open database
    func fetchData(completion: ( Results<User>? )->()) {

                    // realm
        guard let database = database else {
             print("error: database is not found")
             return
           }
        let response = database.objects(User.self)
        
        completion(response)

      
      }
      
      //save database
      func save() {
          guard let database = database else {
               print("error: database is not found")
               return
             }
          try! database.write {
              database.add(DummyData.user)
                  }
      }
    
}
