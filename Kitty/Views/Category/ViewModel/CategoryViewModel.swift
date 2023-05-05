
import Foundation



protocol CategoryListProtocol {
    associatedtype T
    func getCategoryData()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }
    
    var onClickAddCategory: (() -> Void)? {get set}
    
    var listData: [T]? {get set}
}
protocol MediaCategoryProtocol {
    associatedtype T
    var listData: [T]? {get set}
    func getMediaCategoryData()
}

class CategoryViewModel<T>: CategoryListProtocol , MediaCategoryProtocol {
    func getCategoryData() {
        categoryStorageServices.fetchCategory {
            results in
            listData = results?.toArray(ofType: T.self)
        }
    }
    func getMediaCategoryData() {
        categoryStorageServices.fetchMediaCategory {
            results in
            listData = results?.toArray(ofType: T.self)
        }
    }
    
    typealias T = T
    var listData: [T]?
    var onClickAddCategory: (() -> Void)?
    var choosenCategoryCallBack: ((Category?) -> Void)?
 
    let categoryStorageServices: CategoryStorageProtocol
   
    init(service: CategoryStorageProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getCategory()
    }
    
    
    func getCategory() {
     
    }
    
}
