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

    
    @Persisted var media: MediaCategory?

    
    convenience init(categoryName: String?, media: MediaCategory?) {
        self.init()
        self.categoryName = categoryName
        self.media = media
    }
}

enum CategoryEnum: String, PersistableEnum {
    case health
    case gifts
    case unknow
}
class MediaCategory :Object {
    @Persisted var iconUrl: String?
    @Persisted var backgroundColor: String?
    convenience init(iconUrl: String?, backgroundColor: String?) {
        self.init()
        self.iconUrl = iconUrl
        self.backgroundColor = backgroundColor
    }
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
