//
//  AddScreenViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import DropDown
import UIKit

class AddExpenseViewController: UIViewController {
    // MARK: IBOutlet
    
    var refreshHomeData: ((Bool) -> Void)?
    @IBOutlet var dropDownView: DropDownView!
    @IBOutlet var categoryView: UIView!
    
    
    @IBOutlet weak var descriptionTextField: CustomTextField!
    @IBOutlet weak var amountTextField: CurrencyTextField!
    
    // MARK: IBAction
    @IBAction func onTapAddButton(_ sender: UIButton) {
        self.addExpenseViewModel.saveExpense { finish in
            if finish {
                self.refreshHomeData?(true)
                self.navigationController?.popViewController(animated: true)
                
                      } else {
                          print("Error")
                      }
        }
        
    }
    // MARK: Property
    
    lazy var addExpenseViewModel: UpdateExpenseInfomationProtocol = {return  AddExpenseViewModel()}()
    let categoryTitleLabel : UILabel = {
        let textTitle = UILabel()
        
        textTitle.font = UIFont.CustomFont(.regular, size: 16)
        textTitle.textColor = UIColor(named: AssetColor.PrimaryTextColor) ?? .black
        return textTitle
    }()
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTapAround()
        
        configureCategoryView()
        configureTextField()
        bindData()
        
    }
    private func bindData(){
        dropDownView.configure(viewData: DropDownView.ViewData( initValue: self.addExpenseViewModel.choosenMoneyType?.getTitle))
        dropDownView.choosenMonneyType = { [weak self] (result) in
            let type = result?.getMoneyEnum
            self?.addExpenseViewModel.setChoosenCategory(type: type)
        }
        categoryTitleLabel.text = addExpenseViewModel.choosenCategory?.categoryName
    }
   
    // MARK: Config
    private func configureCategoryView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapChooseCategory))
        categoryView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        
        categoryView.addSubview(categoryTitleLabel)
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTitleLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 16),
            categoryTitleLabel.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor),
        ])
        categoryView.layer.cornerRadius = 5
        categoryView.layer.borderWidth = 0.2
        categoryView.layer.borderColor = UIColor(named: AssetColor.borderColor)?.cgColor
    }
    private func configureTextField(){
        amountTextField.keyboardType = .numberPad
        
        amountTextField.passTextFieldText = { [weak self] enteredStringAmount, amountAsDouble in
            self?.addExpenseViewModel.setAmountValue(value: amountAsDouble)
               
              }
        
        descriptionTextField.addTarget(self, action: #selector(onChangedDescription), for: .editingChanged)
    }
  // MARK:
    
}

extension AddExpenseViewController {
    // MARK: Method
    
     @objc func onTapChooseCategory() {
        let categoryViewController = CategoryViewController()
        categoryViewController.categoryViewModel.choosenCategoryCallBack = { [weak self] result in
            self?.addExpenseViewModel.setChoosenCategory(choosenCategory: result)
            self?.bindData()
        }
        let nav = UINavigationController(rootViewController: categoryViewController)
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(nav, animated: true, completion: nil)
    }
    
    private func hideKeyboardOnTapAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
     @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
     @objc func onChangedDescription(){
        self.addExpenseViewModel.setDescriptionAmount(description:descriptionTextField.text)
    }
}
//extension AddExpenseViewController : UITextFieldDelegate {
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//         return true;
//     }
//     func textFieldShouldClear(_ textField: UITextField) -> Bool {
//         return true;
//     }
//     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//         return true;
//     }
//     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//         return true;
//     }
//     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//         textField.resignFirstResponder();
//         return true;
//     }
//
//}
