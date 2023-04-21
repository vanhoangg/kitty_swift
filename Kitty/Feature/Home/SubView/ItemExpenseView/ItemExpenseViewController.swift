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
    
    //MARK: Properties
    struct ViewData
    {
        let itemCategoryIconText : String?
        let itemExpenseValueText : String?
        let itemCategoryText : String?
        let itemNameText :String?
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Method
    func bindData(data:ViewData){
        
        if let itemCategoryIcon = data.itemCategoryIconText {
            self.itemIconImageView.image = UIImage(named: itemCategoryIcon )
        }
        if let itemCategoryDescription = data.itemNameText {
            itemNameLabel.text = itemCategoryDescription
        } else {itemNameLabel.removeFromSuperview()}
        
        self.itemExpenseValueLabel.text = data.itemExpenseValueText
        self.itemCategoryLabel.text = data.itemCategoryText
    }
}
