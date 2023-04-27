
import Foundation



protocol CategoryListProtocol {
    func getCategory()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }
    var listCategory: [Category]? { get set }
}
class CategoryViewModel: CategoryListProtocol {
    var choosenCategoryCallBack: ((Category?) -> Void)?
    var listCategory: [Category]?
    let categoryStorageServices: StorageServiceProtocol
    
    init(service: StorageServiceProtocol = StorageService.init()) {
        self.categoryStorageServices = service
        getCategory()
    }
   
    
    func getCategory() {
        categoryStorageServices.fetchCategory {
            results in
            listCategory = results?.toArray(ofType: Category.self)
        }
    }
   
}
