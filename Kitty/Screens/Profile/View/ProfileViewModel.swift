//
//  ProfileViewModel.swift
//  Kitty
//
//  Created by Doan Ho on 30/05/2023.
//

import Foundation

typealias CallBackModel = () -> Void

class ProfileViewModel{
    var callback: CallBackModel?
    var couter = 0
    func increment(){
        couter = couter + 1
        callback?()
    }
    func decrement(){
        couter = couter - 1
        callback?()
    }
}
