//
//  MainViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 27/04/2023.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.tintColor = UIColor(named: AssetColor.ThirdTextColor)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        build()
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
extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect _: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }

    private func build()  {
//        let rootViewController = LoginViewController()

        // Home
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: AssetIcon.icHome), selectedImage: UIImage(named: AssetIcon.icHomeActive))

        // Setting
        let settingViewController = SettingViewController()
        let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        settingNavigationController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: AssetIcon.icSetting), selectedImage: UIImage(named: AssetIcon.icSettingActive))

        // Report
        let reportViewController = ReportViewController()
        let reportNavigationController = UINavigationController(rootViewController: reportViewController)
        reportNavigationController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: AssetIcon.icReport), selectedImage: UIImage(named: AssetIcon.icReportActive))

        
      
        self.viewControllers = [homeNavigationController, settingNavigationController, reportNavigationController]
        

        
        
    }
}
