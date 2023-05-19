//
//  NotificationCenterService.swift
//  Kitty
//
//  Created by hoang.dinh on 5/19/23.
//

import Foundation
enum NotificationEventKey:String,CaseIterable {
    case updateHomeData = "updateHomeData"
    case updateReportData = "updateReportData"
}
final class NotificationCenterService {
    private static var defaults = NotificationCenter.default

    static func addObserver(selector: Selector, key: NotificationEventKey, _ value: Any? = nil) {
        defaults.addObserver(self, selector: selector, name: NSNotification.Name(key.rawValue), object: value)
    }
    static func removeObserver(key: NotificationEventKey, _ value: Any? = nil) {
        defaults.removeObserver(self, name: NSNotification.Name(key.rawValue), object: value)
    }
    static func post(key: NotificationEventKey, value: Any? = nil) {
        defaults.post(name: NSNotification.Name(key.rawValue), object: value)
    }

}
