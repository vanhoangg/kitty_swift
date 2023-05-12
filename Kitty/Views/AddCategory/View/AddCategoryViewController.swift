//
//  AddCategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 28/04/2023.
//

import UIKit
import FloatingPanel

class AddCategoryViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var imageBorderDashView: RectangularDashedView!
    @IBOutlet weak var categoryNameTextField: CustomTextField!
    @IBOutlet weak var addImageView: UIImageView!

    // MARK: - Properties
    lazy var addCategoryViewModel: AddCategoryProtocol = {
        return AddCategoryViewModel()
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        build()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("Dismiss")
        self.navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Method
    private func build() {
        categoryNameTextField.addTarget(self, action: #selector(onChangeCategoryNameTextField), for: .editingChanged)
        configureIconButton()
        addLoginButton()

    }
    private func configureIconButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapChooseIconCategory))
        imageBorderDashView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        addImageView.setImageColor(color: UIColor(named: AssetColor.ThirdTextColor).unsafelyUnwrapped)
    }
    // MARK: Method
    private func addLoginButton() {
        let loginButton = UIButton()

        loginButton.setTitle("Add new Category", for: .normal)
        loginButton.titleLabel?.font = UIFont.customFont(.medium, size: 14)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.cornerRadius = 16
        loginButton.backgroundColor = .systemBlue
        view.addSubview(loginButton)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)

        ])

        loginButton.addTarget(self, action: #selector(onPressAddNewCategory), for: .touchUpInside)
    }

}
// MARK: Action
extension AddCategoryViewController {

    @objc private func onChangeCategoryNameTextField() {
        addCategoryViewModel.setCategoryName(categoryName: categoryNameTextField.text)
    }
    @objc private func onTapChooseIconCategory() {
        let fpc = FloatingPanelController()
        let mediaCategoryViewController = MediaCategoryViewController()
        mediaCategoryViewController.mediaCategoryViewModel.chooseIconCategoryCallBack = { result in
            guard let iconUrl = result?.iconUrl else {
                return
            }

            guard let backgroundColor = result?.backgroundColor else {return}
            self.addImageView.image = UIImage(named: iconUrl )
            self.imageBorderDashView.backgroundColor = UIColor(named: backgroundColor)
            self.addCategoryViewModel.setMediaCategory(iconUrl: iconUrl, backgroundColor: backgroundColor)
        }
        fpc.set(contentViewController: mediaCategoryViewController)
        fpc.isRemovalInteractionEnabled = true
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.contentMode = .fitToBounds
        self.present(fpc, animated: true, completion: nil)

    }
    @objc private func onPressAddNewCategory() {
        addCategoryViewModel.createNewCategory { (value, error) in
            if value {
               self.showActionDialog(message: "New category addedd successfully! ", actionTitle: "Back to home") {
                  self.navigationController?.popToRootViewController(animated: true)
               }
            } else {
              self.showErrorAlert( message: error.localizedDescription, title: "Clear")
           }

        }
    }
}
