//
//  LoginViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    private let loginButton = IconTextButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        addLoginButton()
        
        
    }
    private func addLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 56),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 40/780,constant: 0),
        ])
        loginButton.configuration(with: IconTextButtonViewModel(text: StringUtils.registerLabel, image: UIImage(named: AssetIcon.icGoogle) ))
        loginButton.addTarget(self, action: #selector(onPressRegister), for: .touchUpInside)
    }
    @objc func onPressRegister() {
        let homeViewController = HomeViewController()
             self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
