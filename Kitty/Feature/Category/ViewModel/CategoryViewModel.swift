
import Foundation

class CategoryViewModel:ObservableObject {
    
    @Published   var listCategory: [ExpenseCategory]
    
    init(){
        loadApi()
    }
    func loadApi(){
        
        DataManager.instance().fetchData{
            (results) in
            
            
            monthlyStatistics = results?[0].listMonthlyStatistic.first(where: { MonthlyStatistic in
                MonthlyStatistic.monthName == "1/2023"
            })
        
          
        }
    }
}
