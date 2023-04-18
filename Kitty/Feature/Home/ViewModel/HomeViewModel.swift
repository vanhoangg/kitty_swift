//
//  File.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import Foundation

class HomeViewModel :ObservableObject {
    
    @Published    var listItem: [String] = []
    
    init(){
        loadApi()
    }
    func loadApi(){
        
        self.listItem = ["a","b","c","d","e","f","g","h","t","z","a","a","a","a","a","a","a","a","a","a",]
    }
}
