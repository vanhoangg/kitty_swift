//
//  AddCategoryViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/4/23.
//

import Foundation

protocol AddCategoryProtocol {

    func setMediaCategory(iconUrl: String?, backgroundColor: String?)
    func setCategoryName(categoryName: String?)
    func createNewCategory(success: (() -> Void)?, failure: ((Error) -> Void)?)
}
class AddCategoryViewModel: AddCategoryProtocol {

    var newCategory: Category = Category()
    let categoryStorageServices: CategoryStorageProtocol

    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
    }
    func setMediaCategory(iconUrl: String?, backgroundColor: String?) {
        let newMediaCategory = MediaCategory()
        newMediaCategory.iconUrl = iconUrl
        newMediaCategory.backgroundColor = backgroundColor
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
    func createNewCategory(success: (() -> Void)?, failure: ((Error) -> Void)?) {
        Log.i("mediaCategory \(newCategory.media)")
        Log.i("categoryName \(newCategory.categoryName)")
        categoryStorageServices.createNewCategory(category: newCategory) {
            success?()
        } failure: { error in
            failure?(error)
        }

    }

}
