//
//  LoginViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addLoginButton()
    }

    private func addLoginButton() {
        let loginButton = IconTextButton()
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: StringUtils.registerLabel, image: UIImage(named: AssetIcon.icGoogle)))
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 56),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40 / 780, constant: 0),
        ])

        loginButton.addTarget(self, action: #selector(onPressRegister), for: .touchUpInside)
    }

    @objc func onPressRegister() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
               present(mainViewController, animated: true, completion: nil)

    }

   
}


