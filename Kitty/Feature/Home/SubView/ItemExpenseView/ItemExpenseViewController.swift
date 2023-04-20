//
//  ItemExpenseViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 20/04/2023.
//

import UIKit



class ItemExpenseViewController: UIViewController {
    static func nib() -> UINib {
        return UINib(nibName: "ItemExpenseViewController", bundle: nil)
    }
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "ItemExpenseViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    @IBOutlet weak var itemExpenseValueLabel: UILabel!
    @IBOutlet weak var itemIconImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func configure(with item:Expenses?){
        itemIconImageView.image = UIImage(named: FunctionUtils.getIconUrl(item?.category))
        itemExpenseValueLabel.text = String(item?.expenseValue ?? 0)
        itemNameLabel.text = item?.expenseDescription
        itemCategoryLabel.text = item?.category.categoryName
    }
}
