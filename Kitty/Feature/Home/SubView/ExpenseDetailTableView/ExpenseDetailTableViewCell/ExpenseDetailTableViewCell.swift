//
//  ExpenseDetailTableViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//

import UIKit

class ExpenseDetailTableViewCell: UITableViewCell {
    static let identifer = "ExpenseDetailTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ExpenseDetailTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
