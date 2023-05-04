//
//  AddCategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 28/04/2023.
//

import UIKit
import FloatingPanel

class AddCategoryViewController: UIViewController {
    @IBOutlet weak var imageBorderDashView: RectangularDashedView!
    
    @IBOutlet weak var categoryNameTextField: CustomTextField!
    @IBOutlet weak var addImageView: UIImageView!
    lazy var addCategoryViewModel : AddCategoryProtocol = {
        return AddCategoryViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addImageView.setImageColor(color: UIColor(named: AssetColor.ThirdTextColor).unsafelyUnwrapped)
        categoryNameTextField.addTarget(self, action: #selector(onChangeCategoryNameTextField), for: .editingChanged)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapChooseIconCategory))
        imageBorderDashView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
    }
    @objc private func onChangeCategoryNameTextField(){
        addCategoryViewModel.setCategoryName(value: categoryNameTextField.text)
    }
    @objc private func onTapChooseIconCategory(){
        let fpc = FloatingPanelController()
       let categoryViewController = CategoryViewController()
       categoryViewController.categoryViewModel.choosenCategoryCallBack = { result in
//           self?.addExpenseViewModel.setChoosenCategory(choosenCategory: result)
//           self?.bindData()
       }
        categoryViewController.viewData = CategoryViewController.ViewData(isShowCategoryName: false, titleLabel: "Choose Category icon", isShowButton: false)
        fpc.set(contentViewController: categoryViewController)
        fpc.isRemovalInteractionEnabled = true
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.contentMode = .fitToBounds
        self.present(fpc, animated: true, completion: nil)
        
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
