//
//  AssetUtils.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import Foundation
import UIKit

/// Type 1 :
/// How to use :  UIColor(named: AssetColor.defaultTextColor)
struct AssetColor {
    static var PrimaryTextColor: String = "21"
    static var SecondaryTextColor: String = "42"
    static var ThirdTextColor: String = "61"
    static var borderColor: String = "Border"
}

struct AssetIcon {
    static var icBank: String = "ic_bank"
    static var icCalendar: String = "ic_calendar"
    static var icCoffee: String = "ic_coffee"
    static var icConstruction: String = "ic_construction"
    static var icGoogle: String = "ic_google"
    static var icHealth: String = "ic_health"
    static var icLaundry: String = "ic_laundry"
    static var icLogo: String = "ic_logo"
    static var icMore: String = "ic_more"
    static var icPayment: String = "ic_payment"
    static var icSearch: String = "ic_search"
    static var icShopping: String = "ic_shopping"
    static var icWallet: String = "ic_wallet"
}
/// Type 2
/// How to use :  UIFont.CustomFontStyle(.semibold,size:12)
extension UIFont {
    public enum CustomFontType: String {
            case semibold = "-Semibold"
            case regular = "-Regular"
            case medium = "-Medium"
            case bold = "-bold"
        }

        static func CustomFont(_ type: CustomFontType = .semibold, size: CGFloat = UIFont.systemFontSize) -> UIFont {
            return UIFont(name: "Inter\(type.rawValue)", size: size)!
        }
}
