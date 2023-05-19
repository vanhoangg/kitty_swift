//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation

protocol MonthlyReportProtocol {
    var filterDate: Date? { get }
    var reloadData: (() -> Void)? {get set}
    func setCurrentFilterDate(filterDate: Date?)
}
class ReportViewModel: MonthlyReportProtocol {
    var reloadData: (() -> Void)?

    var filterDate: Date?

    init() {
        getPickerDate()
        NotificationCenterService.addObserver(selector: #selector(onChangePickerDate), key: .updateReportData)
    }
    deinit {
        NotificationCenterService.removeObserver(key:.updateReportData)
    }
     func getPickerDate() {
         return self.filterDate = UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
    }
    @objc private func onChangePickerDate(_ listenerNotification: Notification) {
        Log.i("listenNotification\(listenerNotification)")
        self.filterDate = (listenerNotification.object as? Date)
        reloadData?()
    }
    func setCurrentFilterDate(filterDate: Date?) {
        UserDefaultsHelper.setData(value: filterDate, key: .pickerDate)
        self.filterDate = filterDate
//        fetchListDataExpense()
    }
}
