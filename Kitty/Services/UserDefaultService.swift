//
//  UserDefaultService.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation
enum UserDefaultKeys: String, CaseIterable {
     case pickerDate
}
final class UserDefaultsHelper: NSObject {
    private static var defaults = UserDefaults.standard

    static func setData<T>(value: T, key: UserDefaultKeys) {
        defaults.set(value, forKey: key.rawValue)
    }

    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }

    static func removeData(key: UserDefaultKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }

    static func clearAll() {
        _ = UserDefaultKeys.allCases.map({ removeData(key: $0) })
    }

}
