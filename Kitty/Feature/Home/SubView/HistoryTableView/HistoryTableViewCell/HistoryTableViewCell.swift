//
//  HistoryTableViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    
    var statisticDay:StatisticDay?;
    static let identifer = "HistoryTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var listItemExpenseStackView: UIStackView!
    
    
    var expenseDetailViewModel = ExpenseDetailViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureData(with data:StatisticDay?){
        self.statisticDay = data
        
        configureListItem()
        
    }
    
}
extension HistoryTableViewCell {
    
    func configureListItem(){
//
//        let listDataExpense: [Expense] : [ Expense(),]
        
        for index in 0...(statisticDay?.expenses.count ?? 0)-1 {
            let itemExpenseController = ItemExpenseViewController()
//            let view: UIView = UIView()
//
//            listItemExpenseStackView.addArrangedSubview(view)
//            view.backgroundColor = UIColor.random()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                view.heightAnchor.constraint(equalToConstant: 50),
//                view.widthAnchor.constraint(equalTo: listItemExpenseStackView.widthAnchor)])
            listItemExpenseStackView.addArrangedSubview(itemExpenseController.view)
            
            itemExpenseController.configure(with:statisticDay?.expenses[index])
            itemExpenseController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
//                itemExpenseController.view.heightAnchor.constraint(equalTo: listItemExpenseStackView.heightAnchor,multiplier:  56/216,constant: 0),
                itemExpenseController.view.heightAnchor.constraint(equalToConstant: 56),
                itemExpenseController.view.widthAnchor.constraint(equalTo: listItemExpenseStackView.widthAnchor)
            ])
            print("height : \(itemExpenseController.view.frame)")

        }
    }
}
