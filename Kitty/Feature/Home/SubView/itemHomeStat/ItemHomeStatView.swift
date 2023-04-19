//
//  ItemHomeStatView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import UIKit


struct ItemHomeStatViewModel {
    let icon: String?
    let value: String?
    let title: String?
    let valueColor: UIColor?
}

class ItemHomeStatView: UIView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    private let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return imageView
    }()
    private let valueLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font     = UIFont(name: "Inter-Medium", size: 14)
        return label
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font     = UIFont(name: "Inter-Regular", size: 12)
        return label
    }()
    private func build() {
        
        addSubview(iconImageView)
        addSubview(valueLabel)
        addSubview(titleLabel)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor,multiplier: 1,constant: 0),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor,constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    func config(with viewModel : ItemHomeStatViewModel){
        iconImageView.image = UIImage(named: viewModel.icon ?? AssetIcon.icWallet)
        valueLabel
            .text = viewModel.value?.currencyFormatting()
        titleLabel.text = viewModel.title
        valueLabel.textColor = viewModel.valueColor
        
    }
    

}
