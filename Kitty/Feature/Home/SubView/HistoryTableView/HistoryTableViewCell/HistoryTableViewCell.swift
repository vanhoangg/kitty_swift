//
//  HistoryTableViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    struct ViewData{
        let dayId:String?
        let dailyExpense:Float?
        let listItemExpenseViewData: [Expenses]?
    }
    //MARK: - IBOutlet
    @IBOutlet weak var listItemExpenseStackView: UIStackView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayTotalExpenseLabel: UILabel!
    
    
    
    //MARK: - Properties
    static let identifer = "HistoryTableViewCell"
    
    
    //MARK: - ViewLifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        build()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func build(){
        dayLabel.font = UIFont.CustomFont(.medium,size:10)
        dayLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        dayTotalExpenseLabel.font = UIFont.CustomFont(.medium,size: 10)
        dayTotalExpenseLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
    }
    
    
    
}

extension HistoryTableViewCell {
    //MARK: - Methods
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
    func loadData(viewData:HistoryTableViewCell.ViewData){
        
        dayLabel.text = viewData.dayId
        dayTotalExpenseLabel.text = String(-(viewData.dailyExpense ?? 0)).currencyFormatting()
        
        configureListItem(listItemExpenseViewData: viewData.listItemExpenseViewData)
    }
    func configureListItem(listItemExpenseViewData:[Expenses]?){
        for index in 0...(listItemExpenseViewData?.count ?? 0)-1 {
            let itemExpenseController = ItemExpenseViewController()
            listItemExpenseStackView.addArrangedSubview(itemExpenseController.view)
            itemExpenseController.bindData(viewData: ItemExpenseViewController.ViewData(itemCategoryIconText: listItemExpenseViewData?[index].category.iconUrl, itemTitleValue: (listItemExpenseViewData?[index].expenseValue ?? 0), itemSubText: listItemExpenseViewData?[index].category.categoryName, itemTitleText: listItemExpenseViewData?[index].expenseDescription, itemCategoryIconBackgroundColor: listItemExpenseViewData?[index].category.colorBackground))
            itemExpenseController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemExpenseController.view.heightAnchor.constraint(equalToConstant: 56),
                itemExpenseController.view.widthAnchor.constraint(equalTo: listItemExpenseStackView.widthAnchor)
            ])
            
        }
    }
}