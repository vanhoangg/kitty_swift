//
//  AddScreenViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 24/04/2023.
//

import DropDown
import UIKit
import FloatingPanel

class AddExpenseViewController: UIViewController {
    // MARK: IBOutlet
    
    
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
    var refreshHomeData: ((Bool) -> Void)?
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
            self?.addExpenseViewModel.setMoneyType(type: type)
        }
        categoryTitleLabel.text = addExpenseViewModel.choosenCategory?.categoryName ?? "Choose Category"
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
        let fpc = FloatingPanelController()
        let categoryViewController = CategoryViewController()
        categoryViewController.categoryViewModel.choosenCategoryCallBack = { [weak self] result in
            self?.addExpenseViewModel.setChoosenCategory(choosenCategory: result)
            self?.bindData()
        }
        categoryViewController.categoryViewModel.onClickAddCategory = { () -> Void in
            let viewController = AddCategoryViewController()
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        fpc.set(contentViewController: categoryViewController)
        fpc.isRemovalInteractionEnabled = true
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.contentMode = .fitToBounds
        self.present(fpc, animated: true, completion: nil)
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
