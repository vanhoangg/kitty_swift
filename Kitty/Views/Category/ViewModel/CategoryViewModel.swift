
import Foundation



protocol CategoryListProtocol {
    func getCategory()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }
    
    var onClickAddCategory: (() -> Void)? {get set}
    
    var listCategory: [Category]? {get set}
}

class CategoryViewModel: CategoryListProtocol {
    
    var listCategory: [Category]?
    var onClickAddCategory: (() -> Void)?
    var choosenCategoryCallBack: ((Category?) -> Void)?
 
    let categoryStorageServices: StorageServiceProtocol
   
    init(service: StorageServiceProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        self.getCategory()
    }
    
    
    func getCategory() {
        categoryStorageServices.fetchCategory {
            results in
            listCategory = results?.toArray(ofType: Category.self)
        }
    }
    
}
