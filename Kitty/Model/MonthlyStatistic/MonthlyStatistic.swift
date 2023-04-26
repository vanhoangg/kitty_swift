//
//  MonthlyStatistic.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift
class MonthlyStatistic : Object{
    @Persisted(primaryKey: true) var id: String?

    @Persisted var yearId:String?
    @Persisted var  monthName:String?
    convenience init(yearId:String?,monthName:String?,id:String?)
    {
        self.init()
        self.id = self.id
        self.monthName = monthName
        self.yearId = yearId
        
        
    }
    
}
