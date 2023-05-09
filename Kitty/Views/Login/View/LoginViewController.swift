//
//  LoginViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var contentLabel: UILabel!
    let loginButton = IconTextButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addLoginButton()
        bindData()
    }
    
    // MARK: - Method
    private func addLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 56),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 40 / 780, constant: 0),
            
            
        ])
        loginButton.addTarget(self, action: #selector(onPressRegister), for: .touchUpInside)
    }
    private func bindData(){
        loginButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: StringUtils.registerLabel, image: UIImage(named: AssetIcon.icGoogle)))
    }
    
    // MARK: - Action
    @objc func onPressRegister() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true, completion: nil)
        
    }
    
}


