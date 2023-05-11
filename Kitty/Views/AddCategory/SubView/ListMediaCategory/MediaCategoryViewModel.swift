//
//  MediaCategoryViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/5/23.
//

import Foundation

protocol MediaCategoryProtocol {
    var listData: [MediaCategory]? {get set}
    func getData()
    var chooseIconCategoryCallBack: ((MediaCategory?) -> Void)? {get set}
}

class MediaCategoryViewModel: MediaCategoryProtocol {
    var chooseIconCategoryCallBack: ((MediaCategory?) -> Void)?

    let categoryStorageServices: CategoryStorageProtocol
    var listData: [MediaCategory]?
    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getData()
    }
    func getData() {
        categoryStorageServices.fetchMediaCategory { mediaCategory in
            listData  = mediaCategory?.toArray(ofType: MediaCategory.self)
        }
    }

}
