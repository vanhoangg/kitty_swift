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
        let dailyExpenseText:String?
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
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    
    
    
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
    func loadData(viewData:HistoryTableViewCell.ViewData){
        
        dayLabel.text = viewData.dayId
        dayTotalExpenseLabel.text = viewData.dailyExpenseText
        
        configureListItem(listItemExpenseViewData: viewData.listItemExpenseViewData)
    }
    
    
}
extension HistoryTableViewCell {
    
    func configureListItem(listItemExpenseViewData:[Expenses]?){
        for index in 0...(listItemExpenseViewData?.count ?? 0)-1 {
            let itemExpenseController = ItemExpenseViewController()
            listItemExpenseStackView.addArrangedSubview(itemExpenseController.view)
            itemExpenseController.bindData(data: ItemExpenseViewController.ViewData(itemCategoryIconText: FunctionUtils.getIconUrl(listItemExpenseViewData?[index].category), itemExpenseValueText: String(listItemExpenseViewData?[index].expenseValue ?? 0), itemCategoryText: listItemExpenseViewData?[index].category.categoryName, itemNameText: listItemExpenseViewData?[index].expenseDescription))
            itemExpenseController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemExpenseController.view.heightAnchor.constraint(equalToConstant: 56),
                itemExpenseController.view.widthAnchor.constraint(equalTo: listItemExpenseStackView.widthAnchor)
            ])
            
        }
    }
}
