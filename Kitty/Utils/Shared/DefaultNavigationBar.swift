//
//  DefaultNavigationBar.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import UIKit

class DefaultNavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    
    
     private func build(){
        self.backgroundColor = UIColor(named: AssetColor.backgroundColor)
         self.isTranslucent = false
         self.titleTextAttributes = [.font: UIFont.CustomFont(.regular,size: 16)]
       
         self.items?.first?.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: AssetIcon.icArrowDown), style: .done, target: self, action: nil)
         
    }
    

}
