//
//  LoadingViewController.swift
//  Kitty
//
//  Created by hoang.dinh on 5/23/23.
//

import UIKit

class LoadingViewController: UIAlertController {
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        // Do any additional setup after loading the view.
    }
    private func build() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        self.view.addSubview(loadingIndicator)
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
