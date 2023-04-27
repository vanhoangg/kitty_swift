//
//  DailyStatistic.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift

class DailyStatistic : Object  {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var dailyExpenses: List<Money>
    @Persisted(originProperty: "dailyExpenses") var monthlyStatistic: LinkingObjects<MonthlyStatistic>
}
