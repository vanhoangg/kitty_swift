//
//  ReportViewModel.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import Foundation
class ReportViewModel {
    let storageService: MoneyStorageProtocol
    var pickerDate: Date?
    init(service: MoneyStorageProtocol = StorageService()) {
        self.storageService = service
        self.getData()
    }
    private func getData() {
        pickerDate = UserDefaultsHelper.getData(type: Date.self, forKey: .pickerDate)
    }
}
