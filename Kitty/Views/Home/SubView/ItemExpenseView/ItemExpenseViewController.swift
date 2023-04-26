//
//  ItemExpenseViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 20/04/2023.
//

import UIKit



class ItemExpenseViewController: UIViewController {
    //MARK: - IBOutlet
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var titleValueLabel: UILabel!
    @IBOutlet weak var subTitleValueLabel: UILabel!
    
    @IBOutlet weak var itemRoundIconView: RoundedUIView!
    //MARK: Properties
    struct ViewData
    {
        let itemCategoryIconText : String?
        let itemTitleValue : Float?
        let itemTitleSubValue : Int? = 0
        let itemSubText : String?
        let itemTitleText :String?
        let itemCategoryIconBackgroundColor:String?
        
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    // MARK: - Method
    
    func build(){
        titleValueLabel.font = UIFont.CustomFont(.regular,size: 14)
        titleValueLabel.textColor = UIColor(named:AssetColor.red)
        subTitleValueLabel.font = UIFont.CustomFont(.regular,size: 14)
        subTitleValueLabel.textColor = UIColor(named:AssetColor.PrimaryTextColor)
        titleLabel.font = UIFont.CustomFont(.regular,size: 14)
        titleLabel.textColor = UIColor(named:AssetColor.PrimaryTextColor)
        subTitleLabel.font = UIFont.CustomFont(.regular,size: 12)
        subTitleLabel.textColor = UIColor(named:AssetColor.ThirdTextColor)
    }
    func bindData(viewData:ViewData){
        
        if let icon = viewData.itemCategoryIconText {
            self.iconImageView.image = UIImage(named: icon )
        }
        if let titleText = viewData.itemTitleText {
            titleLabel.text = titleText
            self.subTitleLabel.text = viewData.itemSubText
        } else if let subTitleText = viewData.itemSubText{
            titleLabel.text = subTitleText
            subTitleLabel.removeFromSuperview()
        }
        
        if(viewData.itemTitleSubValue == 0){
            self.subTitleValueLabel.removeFromSuperview()
            self.titleValueLabel.text = String(-(viewData.itemTitleValue ?? 0)).currencyFormatting()
        } else {
            self.titleValueLabel.text = String(-(viewData.itemTitleValue ?? 0)).currencyFormatting()
            self.subTitleValueLabel.text = String(viewData.itemTitleSubValue ?? 0)+"%"
        }
       
        if let  backgroundColor = viewData.itemCategoryIconBackgroundColor  {itemRoundIconView.backgroundColor = UIColor(named: backgroundColor ) }
        
    }
}
