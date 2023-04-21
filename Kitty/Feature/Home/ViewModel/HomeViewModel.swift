//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

class HomeViewModel :ObservableObject {
    
    @Published    var monthlyStatistics: MonthlyStatistic?
    
    init(){
        loadApi()
    }
    func loadApi(){
        
        self.monthlyStatistics = DummyData.listMonthlyStatistic.first
    }
}
