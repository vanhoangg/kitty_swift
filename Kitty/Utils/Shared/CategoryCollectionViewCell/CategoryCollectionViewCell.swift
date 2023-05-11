//
//  CategoryCollectionViewCell.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    // MARK: - ViewData

    static let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: .main)
    struct ViewData {
        let categoryName: String?
        let iconUrl: String?
        let iconBackgroundColor: String?
        let isShowCategoryName: Bool?
        init(categoryName: String? = nil, iconUrl: String? = nil, iconBackgroundColor: String? = nil, isShowCategoryName: Bool? = true) {
            self.categoryName = categoryName
            self.iconUrl = iconUrl
            self.iconBackgroundColor = iconBackgroundColor
            self.isShowCategoryName = isShowCategoryName
        }
    }

    // MARK: - IBOutlet

    @IBOutlet var shapeView: RoundedUIView!
    @IBOutlet var categoryNameLabel: UILabel!
    @IBOutlet var iconCategoryImageView: UIImageView!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        build()
    }

    // MARK: - Method

    private func build() {
        categoryNameLabel.font = UIFont.customFont(.regular, size: 12)
        categoryNameLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
    }

    func configure(viewData: ViewData) {
        shapeView.backgroundColor = UIColor(named: viewData.iconBackgroundColor ?? "")
        viewData.isShowCategoryName ?? true ? categoryNameLabel.text = viewData.categoryName : categoryNameLabel.removeFromSuperview()
        iconCategoryImageView.image = UIImage(named: viewData.iconUrl ?? "")
    }
}
