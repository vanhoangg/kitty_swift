//
//  LogoImageView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class LogoView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
      buildLogoView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildLogoView()
    }
    private func buildLogoView(){
        let logoImageView = LogoImageView(frame: CGRect(x:0,y:0,width:24,height: 24))
        let logoLabel = LogoLabel()
        addSubview(logoImageView)
        addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layoutMargins = UIEdgeInsets(top: 4,
                                                   left: 4,
                                                   bottom: 4,
                                                   right: 4)
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
        ])
        
    }
}
class LogoImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        self.frame = frame
        image = UIImage(named: AssetIcon.icLogo)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
