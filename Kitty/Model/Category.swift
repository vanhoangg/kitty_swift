//
//  CategoryViewModel.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var categoryName: String?
//    @Persisted var type: CategoryEnum = .unknow
    
    @Persisted var iconUrl: String?
    @Persisted var backgroundColor: String?
    
    convenience init(categoryName: String?, iconUrl: String?,backgroundColor:String?) {
        self.init()
        self.categoryName = categoryName
        self.iconUrl = iconUrl
        self.backgroundColor = backgroundColor
    }
}

enum CategoryEnum: String, PersistableEnum {
    case health
    case gifts
    case unknow
}

extension Category {
//    var iconUrl: String {
//        switch type {
//        case CategoryEnum.health:
//            return AssetIcon.icHealth
//        case CategoryEnum.gifts:
//            return AssetIcon.icGift
//        default:
//            return AssetIcon.icHealth
//        }
//    }
//
//    var colorBackground: String {
//        switch type {
//        case CategoryEnum.health:
//            return AssetColor.healthBackgroundColor
//        case CategoryEnum.gifts:
//            return AssetColor.giftBackgroundColor
//        default:
//            return AssetColor.transportationBackgroundColor
//        }
//    }
}
