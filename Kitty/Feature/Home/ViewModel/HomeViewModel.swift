//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

class HomeViewModel :ObservableObject {
    
    @Published    var listStatisticMonth: StatisticMonth?
    
    init(){
        loadApi()
    }
    func loadApi(){
        
        self.listStatisticMonth = DummyData.listStatisticMonth.first
    }
}
