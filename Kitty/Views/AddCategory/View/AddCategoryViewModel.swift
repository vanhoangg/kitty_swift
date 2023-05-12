//
//  AddCategoryViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/4/23.
//

import Foundation

protocol AddCategoryProtocol {
    var newCategory: Category { get set}
    func setMediaCategory(iconUrl: String?, backgroundColor: String?)
    func setCategoryName(categoryName: String?)
    func createNewCategory(completion: (Bool, Error) -> Void)

}
class AddCategoryViewModel: AddCategoryProtocol {

    var newCategory: Category = Category()
    let categoryStorageServices: CategoryStorageProtocol

    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
    }
    func setMediaCategory(iconUrl: String?, backgroundColor: String?) {
        let newMediaCategory = MediaCategory(iconUrl: iconUrl, backgroundColor: backgroundColor)
        newCategory.media = newMediaCategory
    }
    func setCategoryName(categoryName: String?) {
        newCategory.categoryName = categoryName
    }
    //    func setCategory(_ categoryName:String? = nil,_ iconUrl:String? = nil, _ backgroundColor:String? = nil  ){
    //        if let newCategoryName = categoryName {
    //            newCategory?.categoryName = newCategoryName
    //        }
    //        if let newIconUrl = iconUrl {
    //
    //        }
    //        if let newBackgroundColor = backgroundColor {
    //            newCategory?.media?.backgroundColor = newBackgroundColor
    //        }
    //        print("newCategory \(newCategory)")
    //    }
    func createNewCategory(completion: (Bool, Error) -> Void) {

        categoryStorageServices.createNewCategory(category: newCategory, completion: completion)
    }

}
