//
//  ItemExpenseViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 20/04/2023.
//

import UIKit



class ItemExpenseViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var itemExpenseValueLabel: UILabel!
    @IBOutlet weak var itemIconImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    
    @IBOutlet weak var itemRoundIconView: RoundedUIView!
    //MARK: Properties
    struct ViewData
    {
        let itemCategoryIconText : String?
        let itemExpenseValue : Float?
        let itemCategoryText : String?
        let itemNameText :String?
        let itemCategoryIconBackgroundColor:String?
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    // MARK: - Method
    
    func build(){
        itemExpenseValueLabel.font = UIFont.CustomFont(.regular,size: 14)
        itemExpenseValueLabel.textColor = UIColor(named:AssetColor.red)
        itemNameLabel.font = UIFont.CustomFont(.regular,size: 14)
        itemNameLabel.textColor = UIColor(named:AssetColor.PrimaryTextColor)
        itemCategoryLabel.font = UIFont.CustomFont(.regular,size: 12)
        itemCategoryLabel.textColor = UIColor(named:AssetColor.ThirdTextColor)
    }
    func bindData(viewData:ViewData){
        
        if let itemCategoryIcon = viewData.itemCategoryIconText {
            self.itemIconImageView.image = UIImage(named: itemCategoryIcon )
        }
        if let itemCategoryDescription = viewData.itemNameText {
            itemNameLabel.text = itemCategoryDescription
        } else {itemNameLabel.removeFromSuperview()}
        
        self.itemExpenseValueLabel.text = String(-(viewData.itemExpenseValue ?? 0)).currencyFormatting()
        self.itemCategoryLabel.text = viewData.itemCategoryText
        if let  backgroundColor = viewData.itemCategoryIconBackgroundColor  {itemRoundIconView.backgroundColor = UIColor(named: backgroundColor ) }
        
    }
}
