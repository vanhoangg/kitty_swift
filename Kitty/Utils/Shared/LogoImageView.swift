//
//  LogoImageView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class LogoView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLogoView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildLogoView()
    }

    private func buildLogoView() {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        logoImageView.image = UIImage(named: AssetIcon.icLogo)
        let logoLabel = LogoLabel()
        addSubview(logoImageView)
        addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1, constant: 0),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            logoLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 4)
        ])
    }
}

class LogoLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizeToFit()
        font = UIFont(name: "Inter-Bold", size: 20)
        text = "Kitty"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
