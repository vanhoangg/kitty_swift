//
//  DropDownView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import DropDown
import UIKit

class DropDownView: UIView {
    
    // MARK: - CallBack
    var choosenMonneyType : ((String?) -> Void)?
    // MARK: - Properties

    


    let menu: DropDown = .init()

    struct ViewData {
        let listDataSource: [String] = ["Expense", "Income"]
        let initValue:String?
    }

    var textTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.CustomFont(.regular, size: 16)
        title.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black

        return title
    }()

    var dropDownImageView: UIImageView = {
        let iconDropDown = UIImageView()
        iconDropDown.image = UIImage(named: AssetIcon.icArrowDown)

        return iconDropDown
    }()

    // MARK: - LifeCycle

    init(frame: CGRect, viewData: ViewData) {
        
        super.init(frame: frame)
        build()
        configure(viewData: viewData)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        build()
    }

    // MARK: - Method

    private func build() {
        layer.cornerRadius = 5
        layer.borderWidth = 0.2
        layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapDropDownView))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        addGestureRecognizer(gesture)
        buildMenuDropDown()
        buildTextTitle()
        buildIconRightView()
    }

    // Menu : DropDown
    private func buildMenuDropDown() {
        menu.anchorView = self
        menu.bottomOffset = CGPoint(x: 0, y: (menu.anchorView?.plainView.bounds.height)!)
        (menu as UIView).cornerRadius = 5
        menu.textFont = UIFont.CustomFont(.regular, size: 16)
        menu.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black
      
       
        
        
        menu.selectionAction = { [unowned self] (_: Int, item: String) in
            self.textTitle.text = item
            self.choosenMonneyType?(item)
        }
       
    }
    
    // Title Dropdown
    private func buildTextTitle() {
        addSubview(textTitle)
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }

    // Icon Right
    private func buildIconRightView() {
        addSubview(dropDownImageView)
        dropDownImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dropDownImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func configure(viewData: ViewData) {
        
        menu.dataSource = viewData.listDataSource
        menu.selectRow(at: menu.dataSource.firstIndex(of: viewData.initValue ?? "Expense"))
        textTitle.text = menu.selectedItem

    }

    @objc func onTapDropDownView() {
        menu.show()
    }
}
