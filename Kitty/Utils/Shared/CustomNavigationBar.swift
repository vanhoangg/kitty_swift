//
//  CustomNavigationBar.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class CustomNavigationBar: UIView {
    var titleText: String?
    var actions: UIView?

    required init(titleText: String? = nil, actions: UIView? = nil) {
        super.init(frame: CGRect.zero)

        buildNavigationBar(titleText: titleText, actions: actions)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildNavigationBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildNavigationBar()
    }
}

extension CustomNavigationBar {
    private func buildNavigationBar(titleText: String? = nil, actions: UIView? = nil) {
        if titleText != nil {
            let titleLabel = UILabel()
            titleLabel.font = UIFont.CustomFont(.bold, size: 20)
            titleLabel.text = titleText
            addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ])
        } else {
            let logoView = LogoView()
            logoView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(logoView)
            NSLayoutConstraint.activate([
                logoView.centerYAnchor.constraint(equalTo: centerYAnchor),
                logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ])
        }

        if actions != nil {
            addSubview(actions!)
            actions!.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                actions!.centerYAnchor.constraint(equalTo: centerYAnchor),
                actions!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            ])
        }
    }
}
