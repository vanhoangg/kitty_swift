//
//  User.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 26/04/2023.
//

import Foundation
import RealmSwift
class  User :Object{
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var userName :String?
    
    convenience init(userName:String?)
    {
        self.init()
        self.userName = userName
    }
}

