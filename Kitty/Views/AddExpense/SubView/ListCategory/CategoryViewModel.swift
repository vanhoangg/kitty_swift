import Foundation

protocol CategoryListProtocol {

    func getCategoryData()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }

    var onClickAddCategory: (() -> Void)? {get set}

    var listData: [Category]? {get set}
}

class CategoryViewModel: CategoryListProtocol {
    var listData: [Category]?
    var onClickAddCategory: (() -> Void)?
    var choosenCategoryCallBack: ((Category?) -> Void)?
    let categoryStorageServices: CategoryStorageProtocol

    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getCategoryData()
    }

    func getCategoryData() {
        categoryStorageServices.fetchCategory { results in
            listData = results?.toArray(ofType: Category.self)
        }
    }

}
