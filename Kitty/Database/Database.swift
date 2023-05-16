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
protocol IDataManager {
    func saveRecord<T: Object>(record: T, success: (() -> Void)?, failure: ((Error) -> Void)?)
    func deleteRecord<T: Object>(record: T, success: (() -> Void)?, failure: ((Error) -> Void)?)
    func getRecord<T: Object>(success: ((Results<T>) -> Void)?, failure: ((Error) -> Void)?)
}

final class DataManager: IDataManager {
    static var sharedInstance: DataManager = {
        let realm = try? Realm()
        let dataManager = DataManager(database: realm)
        print("File \(String(describing: realm?.configuration.fileURL))")
        // config
        dataManager.initDatabase(realm)
        return dataManager
    }()

    var realm: Realm?
    init(database: Realm?) {
        self.realm = database
    }
    // config database
    private func initDatabase(_ realm: Realm?) {
        guard let notNullDatabase = realm else {return}
        if notNullDatabase.objects(MediaCategory.self).isEmpty {
            try? notNullDatabase.write {
                notNullDatabase.add(DummyData.listMediaCategory)
            }
        }
    }
    func getRecord<T: Object>(success: ((Results<T>) -> Void)?, failure: ((Error) -> Void)?) {
        print(T.self)

        let results: Results<T>? =  realm?.objects(T.self)

        if let notEmptyResults = results {
            success?(notEmptyResults)
        } else {
            failure?(KTError.errorEmptyData)
        }

    }
    // properties
    func saveRecord<T: Object>(record: T, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        do {
            try realm?.write({
                realm?.add(record)
                success?()
            })
        } catch let error {
            failure?(error)
        }
    }

    func deleteRecord<T: Object>(record: T, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        do {
            try realm?.write({
                realm?.delete(record)
                success?()
            })
        } catch let error {
            failure?(error)
        }
    }

}
