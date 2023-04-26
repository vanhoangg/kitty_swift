//
//  SettingViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class SettingViewController: UIViewController {
    let actionsNavigationBar: UIView = {
        let actionNavigationBar = UIView()
        let iconSearchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let iconMoreImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        iconSearchImageView.image = UIImage(named: AssetIcon.icSearch)
        iconMoreImageView.image = UIImage(named: AssetIcon.icMore)
        iconSearchImageView.translatesAutoresizingMaskIntoConstraints = false
        iconMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconMoreImageView.leadingAnchor.constraint(equalTo: iconMoreImageView.trailingAnchor),
        ])
        actionNavigationBar.addSubview(iconSearchImageView)
        actionNavigationBar.addSubview(iconMoreImageView)
        return actionNavigationBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        let customNavigationBar = CustomNavigationBar(titleText: StringUtils.reportLabel, actions: actionsNavigationBar)

        view.addSubview(customNavigationBar)
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 48 / 780, constant: 1),
        ])
        // Do any additional setup after loading the view.
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
