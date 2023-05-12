//
//  Database.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import Foundation
import RealmSwift
struct DummyData {
    static let listMediaCategory: [MediaCategory] =
    [
        MediaCategory(iconUrl: AssetIcon.icHealth, backgroundColor: AssetColor.healthBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icGift, backgroundColor: AssetColor.giftBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icBank, backgroundColor: AssetColor.backgroundColor),
        MediaCategory(iconUrl: AssetIcon.icCoffee, backgroundColor: AssetColor.coffeeBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icConstruction, backgroundColor: AssetColor.constructionBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icEdu, backgroundColor: AssetColor.eduBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icElectronic, backgroundColor: AssetColor.electronicBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icGas, backgroundColor: AssetColor.gasBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icLaundry, backgroundColor: AssetColor.laudryBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icLiquor, backgroundColor: AssetColor.liquorBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icMoney, backgroundColor: AssetColor.moneyBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icRestaurant, backgroundColor: AssetColor.restaurantBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSavingMoney, backgroundColor: AssetColor.savingBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSelfImprove, backgroundColor: AssetColor.selfImproveBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icShopping, backgroundColor: AssetColor.shoppingBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icSport, backgroundColor: AssetColor.sportBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icTransportation, backgroundColor: AssetColor.transportationBackgroundColor),
        MediaCategory(iconUrl: AssetIcon.icVolunteer, backgroundColor: AssetColor.volunteerBackgroundColor)
    ]
}

final class DataManager {
    static let instance: DataManager = {
        let realm = try? Realm()
        let dataManager = DataManager(database: realm)
        print("File \(String(describing: realm?.configuration.fileURL))")
        // config
        dataManager.initDatabase(realm)
        return dataManager
    }()
    // properties
    var database: Realm?
    init(database: Realm?) {
        self.database = database
    }
    // config database
    private func initDatabase(_ realm: Realm?) {
        guard let notNullDatabase = database else {return}
        if notNullDatabase.objects(MediaCategory.self).isEmpty {
            try? notNullDatabase.write {
                notNullDatabase.add(DummyData.listMediaCategory)
            }
        }
    }
}
