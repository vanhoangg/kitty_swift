//
//  SceneDelegate.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 17/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
//
        window.rootViewController = settingRoute();
     
        
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate : UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           print("Selected Tab : \(tabBarController.selectedIndex)")
       }
    private func settingRoute() -> UITabBarController {
//        let rootViewController = LoginViewController()

     
        //Home
              let homeViewController = HomeViewController()
              let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: AssetIcon.icHome), selectedImage: UIImage(named: AssetIcon.icHomeActive))
              
              //Setting
              let settingViewController = SettingViewController()
              let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        settingNavigationController.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: AssetIcon.icSetting), selectedImage: UIImage(named: AssetIcon.icSettingActive))
        
              
              //Report
              let reportViewController = ReportViewController()
              let reportNavigationController = UINavigationController(rootViewController: reportViewController)
        reportNavigationController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: AssetIcon.icReport), selectedImage: UIImage(named: AssetIcon.icReportActive))
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavigationController, settingNavigationController, reportNavigationController]
        tabbarController.delegate = self
               
        tabbarController.tabBar.tintColor = UIColor(named: AssetColor.ThirdTextColor)
                
        return tabbarController
    }
}
