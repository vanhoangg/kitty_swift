//
//  AddScreenViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import UIKit
import DropDown


class AddScreenViewController: UIViewController {

  
    
    @IBOutlet weak var dropDownView: DropDownView!
    
    @IBOutlet weak var categoryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTapAround()
        buildCategoryView()
        
        
        
        // Do any additional setup after loading the view.
    }
    private func buildCategoryView(){
        categoryView.layer.cornerRadius = 5
        categoryView.layer.borderWidth = 0.2
        categoryView.layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapCategoryView))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        categoryView.addGestureRecognizer(gesture)
        let textTitle = UILabel()
        textTitle.font = UIFont.CustomFont(.regular,size: 16)
        textTitle.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black
        
        categoryView.addSubview(textTitle)
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textTitle.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor,constant: 16),
            textTitle.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor)])

    }
    @objc func onTapCategoryView() {
        //        textTitle.text = menu.selectedItem
        let categoryViewController = CategoryViewController()
           let nav = UINavigationController(rootViewController: categoryViewController)
           // 1
           nav.modalPresentationStyle = .pageSheet

           
           // 2
           if let sheet = nav.sheetPresentationController {

               // 3
               sheet.detents = [.medium(), .large()]

           }
           // 4
           present(nav, animated: true, completion: nil)
        
    }
    func hideKeyboardOnTapAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}

