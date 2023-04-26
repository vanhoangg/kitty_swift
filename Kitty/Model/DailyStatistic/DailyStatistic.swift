//
//  DailyStatistic.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift
class DailyStatistic : Object {
    @Persisted(primaryKey: true) var id: String?

    
    @Persisted var dayName:String?
    
    convenience init(dayName: String?,dayId:String?) {
        self.init()
        self.dayName = dayName
        self.id = dayId
    }
}
