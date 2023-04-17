//
//  CustomNavigationBar.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class CustomNavigationBar: UIView {
    
    
    var titleLabel: UILabel?
    var actions: UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildNavigationBar()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildNavigationBar()
    }
    
    
    
}

extension CustomNavigationBar {
    
    private func buildNavigationBar() -> Void {
        
        
        if titleLabel != nil {
            
            addSubview(titleLabel!)
            titleLabel!.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel!.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                titleLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16)
            ])
        } else {
            let logoView = LogoView()
           
            addSubview(logoView)
            
        }
        
    }
}
