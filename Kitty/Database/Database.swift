//
//  Database.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import Foundation
import RealmSwift
struct DummyData {
//    static let listCategory: [Category] = [Category(categoryName: "Gift", media: MediaCategory(iconUrl: AssetIcon.icHealth,backgroundColor: AssetColor.healthBackgroundColor)), Category(categoryName: "Health", media: MediaCategory(iconUrl: AssetIcon.icGift,backgroundColor: AssetColor.giftBackgroundColor))]
    static let listMediaCategory: [MediaCategory] =
    [
        MediaCategory(iconUrl: AssetIcon.icHealth,backgroundColor: AssetColor.healthBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icGift,backgroundColor: AssetColor.giftBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icBank,backgroundColor: AssetColor.backgroundColor),
        MediaCategory(iconUrl: AssetIcon.icCoffee,backgroundColor: AssetColor.coffeeBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icConstruction,backgroundColor: AssetColor.constructionBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icEdu,backgroundColor: AssetColor.eduBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icElectronic,backgroundColor: AssetColor.electronicBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icGas,backgroundColor: AssetColor.gasBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icLaundry,backgroundColor: AssetColor.laudryBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icLiquor,backgroundColor: AssetColor.liquorBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icMoney,backgroundColor: AssetColor.moneyBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icRestaurant,backgroundColor: AssetColor.restaurantBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSavingMoney,backgroundColor: AssetColor.savingBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSelfImprove,backgroundColor: AssetColor.selfImproveBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icShopping,backgroundColor: AssetColor.shoppingBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSport,backgroundColor: AssetColor.sportBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icTransportation,backgroundColor: AssetColor.transportationBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icVolunteer,backgroundColor: AssetColor.volunteerBackgroundColor),
        
        
    ]
}

final class DataManager {
    static let instance: DataManager = {
        let dataManager = DataManager()
        let database = try! Realm()
        // config
        
        dataManager.configDatabase(realm: database)
        dataManager.initDatabase()
        print(database.configuration.fileURL ?? "")
        return dataManager
    }()
    
    
    // properties
    var database: Realm?
    
    
    
    // config database
    private func configDatabase(realm: Realm) {
        database = realm
    }
    private func initDatabase() {
        guard let database = database else {
            print("error: database is not found")
            return
        }
        if (database.objects(MediaCategory.self).isEmpty){
            try! database.write {
//                database.add(DummyData.listCategory)
                database.add(DummyData.listMediaCategory)
                
            } }
    }
    
}

