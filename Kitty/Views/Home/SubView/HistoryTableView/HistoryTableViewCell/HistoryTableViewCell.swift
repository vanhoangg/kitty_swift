//
//  HistoryTableViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    struct ViewData {
        let dayName: String?
        let dailyExpense: Double?
        let listItemExpenseViewData: [Money]?
    }

    // MARK: - IBOutlet

    @IBOutlet var listItemExpenseStackView: UIStackView!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dayTotalExpenseLabel: UILabel!

    // MARK: - Properties

    static let identifer = "HistoryTableViewCell"

    // MARK: - ViewLifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        build()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
   
    private func build() {
        dayLabel.font = UIFont.CustomFont(.medium, size: 10)
        dayLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        dayTotalExpenseLabel.font = UIFont.CustomFont(.medium, size: 10)
        dayTotalExpenseLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
//        listItemExpenseStackView.sizeToFit()
        
    }
}

extension HistoryTableViewCell {
    // MARK: - Methods

    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }

    func loadData(viewData: HistoryTableViewCell.ViewData) {
        dayLabel.text = viewData.dayName
        dayTotalExpenseLabel.text = String(-(viewData.dailyExpense ?? 0)).currencyFormatting()

        configureListItem(listItemExpenseViewData: viewData.listItemExpenseViewData)
    }

    func configureListItem(listItemExpenseViewData: [Money]?) {
        listItemExpenseStackView.removeAllSubViews()
        
        
      
        for index in 0 ... (listItemExpenseViewData?.count ?? 0) - 1 {
            let itemExpenseController = ItemExpenseViewController()
//            listItemExpenseStackView.distribution = .fillProportionally
            listItemExpenseStackView.addArrangedSubview(itemExpenseController.view)
            itemExpenseController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemExpenseController.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 56 ),
            ])
            
            
            itemExpenseController.bindData(viewData: ItemExpenseViewController.ViewData(itemCategoryIconText: listItemExpenseViewData?[index].category?.media?.iconUrl, itemTitleValue: listItemExpenseViewData?[index].value ?? 0, itemSubText: listItemExpenseViewData?[index].category?.categoryName, itemTitleText: listItemExpenseViewData?[index].valueDescription, itemCategoryIconBackgroundColor: listItemExpenseViewData?[index].category?.media?.backgroundColor))
//            listItemExpenseStackView.layoutIfNeeded()
        }
        
    }
}
