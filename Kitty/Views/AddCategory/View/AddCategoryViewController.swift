//
//  AddCategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 28/04/2023.
//

import UIKit
import FloatingPanel

class AddCategoryViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var imageBorderDashView: RectangularDashedView!
    
    @IBOutlet weak var categoryNameTextField: CustomTextField!
    @IBOutlet weak var addImageView: UIImageView!
    
    // MARK: Properties
    lazy var addCategoryViewModel : AddCategoryProtocol = {
        return AddCategoryViewModel()
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       build()
    }
    
    // MARK: Method
    private func build(){
        categoryNameTextField.addTarget(self, action: #selector(onChangeCategoryNameTextField), for: .editingChanged)
        configureIconButton()
        configureSubmitButton()
    }
    private func configureIconButton(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapChooseIconCategory))
        imageBorderDashView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        addImageView.setImageColor(color: UIColor(named: AssetColor.ThirdTextColor).unsafelyUnwrapped)
    }
    private func configureSubmitButton() {
        let addButton = IconTextButton()
        view.addSubview(addButton)

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.configure(viewData: IconTextButton.IconTextButtonViewData(text: "Add new category", image: UIImage(named: AssetIcon.icAdd)))

        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
        addButton.configureStyle(cornerRadius: 22, borderWidth: 0, backgroundColor: UIColor(named: AssetColor.buttonBackgroundColor), textColor: .white)
        addButton.addTarget(self, action: #selector(onPressAddNewCategory), for: .touchUpInside)
    }
 
  

}
//MARK: Action
extension AddCategoryViewController {
    
    @objc private func onChangeCategoryNameTextField(){
        addCategoryViewModel.setCategoryName(value: categoryNameTextField.text)
    }
    @objc private func onTapChooseIconCategory(){
        let fpc = FloatingPanelController()
       let mediaCategoryViewController = MediaCategoryViewController()
        mediaCategoryViewController.mediaCategoryViewModel.chooseIconCategoryCallBack = { result in
            guard let iconUrl = result?.iconUrl else
                {
                    return
                }
            
            guard let backgroundColor = result?.backgroundColor else {return}
            self.addImageView.image = UIImage(named: iconUrl )
            self.imageBorderDashView.backgroundColor = UIColor(named: backgroundColor)
       }
        fpc.set(contentViewController: mediaCategoryViewController)
        fpc.isRemovalInteractionEnabled = true
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.contentMode = .fitToBounds
        self.present(fpc, animated: true, completion: nil)
        
    }
    @objc private func onPressAddNewCategory(){
        addCategoryViewModel.setCategoryName(value: categoryNameTextField.text)
    }
}
