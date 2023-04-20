//
//  Expense.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 20/04/2023.
//

import Foundation


struct  FunctionUtils {
//    case persional
//    case health
//    case transportation
//    case gifts
//    case electronic
//    case coffee_bar

    static func getIconUrl(_ type : ExpenseCategory?) -> String {
        switch type?.categoryId {
        
        case "category1":
            return AssetIcon.icHealth
        case "category2":
            return AssetIcon.icGift
      
        default:
            return AssetIcon.icHealth
        }
    }
    
}
