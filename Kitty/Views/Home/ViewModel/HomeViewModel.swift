//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var monthlyStatistics: MonthlyStatistic?

    init() {
        loadApi()
    }

    func loadApi() {
        DataManager.instance().save()
        DataManager.instance().fetchData {
            _ in

//            monthlyStatistics = results?[0].listMonthlyStatistic.first(where: { MonthlyStatistic in
//                MonthlyStatistic.monthName == "1/2023"
//            })
        }
    }
}
