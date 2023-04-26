
import Foundation



protocol CategoryListProtocol {
    func getCategory()
    var choosenCategoryCallBack: ((Category?) -> Void)? { get set }
    var listCategory: [Category]? { get set }
}
class CategoryViewModel: CategoryListProtocol {
    var choosenCategoryCallBack: ((Category?) -> Void)?
    var listCategory: [Category]?
    
    func getCategory() {
        DataManager.instance().fetchCategory {
            results in
            listCategory = results?.toArray(ofType: Category.self)
        }
    }
    init() {
        getCategory()
    }

   
}
