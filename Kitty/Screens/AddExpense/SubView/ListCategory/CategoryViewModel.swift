import Foundation

protocol CategoryListProtocol {

    func getCategoryData()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }
    var didLoadListCategorySuccess: (() -> Void)? {get set}
    var didLoadListCategoryFail: ((Error) -> Void)? {get set}
    var onClickAddCategory: (() -> Void)? {get set}
    var listData: [Category]? {get set}
}

class CategoryViewModel: CategoryListProtocol {
    var didLoadListCategorySuccess: (() -> Void)?
    var didLoadListCategoryFail: ((Error) -> Void)?
    var listData: [Category]?
    var onClickAddCategory: (() -> Void)?
    var choosenCategoryCallBack: ((Category?) -> Void)?
    let categoryStorageServices: CategoryStorageProtocol

    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getCategoryData()
    }

    func getCategoryData() {
        categoryStorageServices.fetchCategory(success: { listCategory in
            self.listData = listCategory
            self.didLoadListCategorySuccess?()
        }, failure: { error in
            self.didLoadListCategoryFail?(error)
        })
    }

}
