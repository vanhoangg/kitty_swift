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
    static let PrimaryTextColor: String = "21"
    static let SecondaryTextColor: String = "42"
    static let ThirdTextColor: String = "61"
    static let borderColor: String = "border"
    static let red: String = "red"
    static let gray: String = "gray"
    static let giftBackgroundColor: String = "giftBackgroundColor"
    static let healthBackgroundColor: String = "healthBackgroundColor"
    static let transportationBackgroundColor: String = "transportationBackgroundColor"
    static let buttonBackgroundColor: String = "buttonBackgroundColor"
}

enum AssetIcon {
    static let icBank: String = "ic_bank"
    static let icCalendar: String = "ic_calendar"
    static let icCoffee: String = "ic_coffee"
    static let icConstruction: String = "ic_construction"
    static let icGoogle: String = "ic_google"
    static let icHealth: String = "ic_health"
    static let icLaundry: String = "ic_laundry"
    static let icLogo: String = "ic_logo"
    static let icMore: String = "ic_more"
    static let icPayment: String = "ic_payment"
    static let icSearch: String = "ic_search"
    static let icShopping: String = "ic_shopping"
    static let icWallet: String = "ic_wallet"
    static let icHome: String = "ic_home"
    static let icSetting: String = "ic_setting"
    static let icReport: String = "ic_report"
    static let icHomeActive: String = "ic_home_active"
    static let icSettingActive: String = "ic_setting_active"
    static let icReportActive: String = "ic_report_active"
    static let icTransportation: String = "ic_transportation"
    static let icGift: String = "ic_gift"
    static let icElectronic: String = "ic_electronic"
    static let icAdd: String = "ic_add_circle"
    static let icArrowDown: String = "ic_arrow_down"
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
