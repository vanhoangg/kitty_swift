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
    var didLoadListMediaCategorySuccess: (() -> Void)? {get set}
    var didLoadListMediaCategoryFail: ((Error) -> Void)? {get set}
}

class MediaCategoryViewModel: MediaCategoryProtocol {
    var didLoadListMediaCategorySuccess: (() -> Void)?
    var didLoadListMediaCategoryFail: ((Error) -> Void)?
    var chooseIconCategoryCallBack: ((MediaCategory?) -> Void)?

    let categoryStorageServices: CategoryStorageProtocol
    var listData: [MediaCategory]?
    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getData()
    }
    func getData() {
        categoryStorageServices.fetchMediaCategory { result in
            switch result {
            case .success(let resultMediaCategory):
                listData = resultMediaCategory.toArray(ofType: MediaCategory.self)
                didLoadListMediaCategorySuccess?()
            case .failure(let error):
                didLoadListMediaCategoryFail?(error)
            }
        }
    }

}
