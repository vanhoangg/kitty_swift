//
//  CategoryCollectionViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    struct ViewData {
        let categoryName:String?
        let iconUrl:String?
        let iconBackgroundColor:String?
    }
    
    @IBOutlet weak var shapeView: RoundedUIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var iconCategoryImageView: UIImageView!
    
    
    func configure(viewData:ViewData){
        shapeView.backgroundColor = UIColor(named: viewData.iconBackgroundColor ?? "")
        categoryNameLabel.text = viewData.categoryName
    
        iconCategoryImageView.image = UIImage(named: viewData.iconUrl ?? "")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        build()
        // Initialization code
    }
    private func build(){
        categoryNameLabel.font = UIFont.CustomFont(.regular,size: 12)
        categoryNameLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
    }

}
