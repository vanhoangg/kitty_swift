
import Foundation

class CategoryViewModel:ObservableObject {
    
    @Published var listCategory: [Category]?
    
    
    init(){
        loadApi()
    }
    func loadApi(){
        //        DataManager.instance().save()
        DataManager.instance().fetchCategory{
            (results) in
            listCategory = results?.toArray(ofType: Category.self)
            
            //            monthlyStatistics = results?[0].listMonthlyStatistic.first(where: { MonthlyStatistic in
            //                MonthlyStatistic.monthName == "1/2023"
            //            })
            
            
        }
    }
    func chooseCategory(choosenCategory:Category){
//        AddExpenseViewModel.choosenCategory = choosenCategory
    }
}
