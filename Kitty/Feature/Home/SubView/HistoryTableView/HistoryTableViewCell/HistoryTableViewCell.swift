//
//  HistoryTableViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    static let identifer = "HistoryTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var expenseDetailTableView: ExpenseDetailTableView!
    
    var expenseDetailViewModel = ExpenseDetailViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configExpenseDetailTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HistoryTableViewCell {
    private func configExpenseDetailTableView(){
        
        
        expenseDetailTableView.items = expenseDetailViewModel.listItem
        expenseDetailTableView.bounces = false
        expenseDetailTableView.rowHeight = UITableView.automaticDimension
        expenseDetailTableView.estimatedRowHeight = 600
        expenseDetailTableView.sizeToFit()
        
      

     
       
    }
}
