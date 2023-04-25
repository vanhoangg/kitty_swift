//
//  CategoryViewModel.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import Foundation
import RealmSwift

class ExpenseCategory :Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var categoryName:String?
    @Persisted var type:CategoryEnum = CategoryEnum.unknow
    convenience init(categoryName:String? = "" ,type:CategoryEnum?)
    {
        self.init()
        self.categoryName = categoryName
        
        if let type = type {
            self.type = type
        }
    }
    
}
enum CategoryEnum: String, PersistableEnum {
    case health
    case gifts
    case unknow
}
extension ExpenseCategory {
    var iconUrl:String  {
        switch  type {
        case CategoryEnum.health:
            return AssetIcon.icHealth
        case CategoryEnum.gifts:
            return AssetIcon.icGift
        default:
            return AssetIcon.icHealth
        }
    }
    var colorBackground: String {
        switch  type {
        case CategoryEnum.health:
            return AssetColor.healthBackgroundColor
        case CategoryEnum.gifts:
            return AssetColor.giftBackgroundColor
        default:
            return AssetColor.transportationBackgroundColor
        }
    }
}
