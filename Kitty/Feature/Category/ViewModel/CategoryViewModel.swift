
import Foundation

class CategoryViewModel:ObservableObject {
    
    @Published   var listCategory: [ExpenseCategory]?
    
    init(){
        loadApi()
    }
    func loadApi(){
//        DataManager.instance().save()
        DataManager.instance().fetchCategory{
            (results) in
            listCategory = results?.toArray(ofType: ExpenseCategory.self)
            
//            monthlyStatistics = results?[0].listMonthlyStatistic.first(where: { MonthlyStatistic in
//                MonthlyStatistic.monthName == "1/2023"
//            })
        
          
        }
    }
}
