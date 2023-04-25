//
//  DropDownView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit
import DropDown

class DropDownView: UIView {
    // MARK: - Properties
    var defaultDataSource = ["Expense", "Balance", "Income"]
    var viewData:ViewData? {
        didSet
        {
            menu.dataSource = self.viewData?.listDataSource ?? defaultDataSource
            menu.reloadAllComponents()
        }
    }
    let menu:DropDown = DropDown()

    struct ViewData{
        let listDataSource:[String]?
    }
    
    var textTitle:UILabel =  {
        let title = UILabel()
        title.font = UIFont.CustomFont(.regular,size: 16)
        title.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black
        
        return title
    } ()
    var dropDownImageView:UIImageView = {
        let iconDropDown = UIImageView()
        iconDropDown.image = UIImage(named: AssetIcon.icArrowDown)
        
        return iconDropDown
    }()
    // MARK: - LifeCycle
    init(frame: CGRect,viewData:ViewData) {
        self.viewData = viewData
        super.init(frame: frame)
        build()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        build()
    }
    // MARK: - Method
    
    private func build(){
     
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapDropDownView))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        self.addGestureRecognizer(gesture)
        buildMenuDropDown()
        buildTextTitle()
        buildIconRightView()
        
    }
    
    // Menu : DropDown
    private func buildMenuDropDown(){
        



        menu.anchorView = self
        menu.bottomOffset = CGPoint(x: 0, y:(menu.anchorView?.plainView.bounds.height)!)
        (menu as UIView).cornerRadius = 5
        menu.textFont = UIFont.CustomFont(.regular,size:16)
        menu.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black
        menu.dataSource = defaultDataSource
        menu.selectRow(at: 0)
        menu.selectionAction = { [unowned self] (index: Int, item: String) in
            textTitle.text = item
        }
        
        
    }
    // Title Dropdown
    private func buildTextTitle(){
        self.addSubview(textTitle)
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            textTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        textTitle.text = menu.selectedItem
    }
    // Icon Right
    private func buildIconRightView(){
        self.addSubview(dropDownImageView)
        dropDownImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            dropDownImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
    }
    
    func configure(viewData:ViewData){
        self.viewData = viewData
    }
    @objc func onTapDropDownView() {
        menu.show()
        
    }
}
