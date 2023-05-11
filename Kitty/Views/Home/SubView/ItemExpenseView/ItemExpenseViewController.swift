//
//  ItemExpenseViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 20/04/2023.
//

import UIKit

class ItemExpenseViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var iconImageView: UIImageView!

    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var subTitleLabel: UILabel!

    @IBOutlet var titleValueLabel: UILabel!
    @IBOutlet var subTitleValueLabel: UILabel!

    @IBOutlet var itemRoundIconView: RoundedUIView!

    // MARK: Properties

    struct ViewData {
        let itemCategoryIconText: String?
        let itemTitleValue: Double?
        let itemTitleSubValue: Int? = 0
        let itemSubText: String?
        let itemTitleText: String?
        let itemCategoryIconBackgroundColor: String?
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }

    // MARK: - Method

    func build() {
        titleValueLabel.font = UIFont.customFont(.regular, size: 14)
        titleValueLabel.textColor = UIColor(named: AssetColor.red)
        subTitleValueLabel.font = UIFont.customFont(.regular, size: 14)
        subTitleValueLabel.textColor = UIColor(named: AssetColor.PrimaryTextColor)
        titleLabel.font = UIFont.customFont(.regular, size: 14)
        titleLabel.textColor = UIColor(named: AssetColor.PrimaryTextColor)
        subTitleLabel.font = UIFont.customFont(.regular, size: 12)
        subTitleLabel.textColor = UIColor(named: AssetColor.ThirdTextColor)
    }

    func bindData(viewData: ViewData) {
        if let icon = viewData.itemCategoryIconText {
            iconImageView.image = UIImage(named: icon)
        }
        if let titleText = viewData.itemTitleText {
            titleLabel.text = titleText
            subTitleLabel.text = viewData.itemSubText
        } else if let subTitleText = viewData.itemSubText {
            titleLabel.text = subTitleText
            subTitleLabel.removeFromSuperview()
        } else {
            titleLabel.text = "Unknow"
            subTitleLabel.removeFromSuperview()
        }

        if viewData.itemTitleSubValue == 0 {
            subTitleValueLabel.removeFromSuperview()
            titleValueLabel.text = String(-(viewData.itemTitleValue ?? 0)).currencyFormatting()
        } else {
            titleValueLabel.text = String(-(viewData.itemTitleValue ?? 0)).currencyFormatting()
            subTitleValueLabel.text = String(viewData.itemTitleSubValue ?? 0) + "%"
        }

        if let backgroundColor = viewData.itemCategoryIconBackgroundColor { itemRoundIconView.backgroundColor = UIColor(named: backgroundColor) } else {
            itemRoundIconView.backgroundColor = .black

        }
    }
}
