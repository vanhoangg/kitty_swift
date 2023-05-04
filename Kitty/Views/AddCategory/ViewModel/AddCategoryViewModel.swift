//
//  AddCategoryViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/4/23.
//

import Foundation


protocol AddCategoryProtocol{
    var categoryName:String? { get set}
    var iconUrl:String? { get set}
    var backgroundColor:String? { get set}
    func setCategoryName(value:String?)
    func setIconUrl(value:String?)
    func setBackgroundColor(value:String?)
}
class AddCategoryViewModel : AddCategoryProtocol {
    var categoryName: String?
    
    var iconUrl: String?
    
    var backgroundColor: String?
    
    
    func setCategoryName(value:String?){
            categoryName = value
    }
    func setIconUrl(value:String?){
            iconUrl = value
    }
    func setBackgroundColor(value:String?){
            backgroundColor = value
    }

}
