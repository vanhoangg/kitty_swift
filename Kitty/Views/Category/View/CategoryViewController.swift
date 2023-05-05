//
//  CategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //Properties
    struct ViewData{
        let isShowCategoryName:Bool?
        let titleLabel:String?
        let isShowButton:Bool?
    }
    var viewData:ViewData!
    // MARK: IBOutlet
    
    @IBOutlet var addCategoryButton: UIButton!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var chooseCategoryLabel: UILabel!

    // MARK: Properties
    let identifer = "categoryCell"
    let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: .main)
    lazy var categoryViewModel :any CategoryListProtocol =
    {
        print(viewData.titleLabel)
        return CategoryViewModel<Category>()
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
}

// MARK: Method

extension CategoryViewController {
    

    //MARK: - Methods
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.categoryCollectionView.reloadData()
        }
    }
    
    private func build() {
        print("ViewData\(viewData)")
        configureChooseCategoryLabel()
        configureAddButtonCategory()
        configureCategoryCollectionView()
    }

    private func configureChooseCategoryLabel() {
        chooseCategoryLabel.text = (viewData?.titleLabel ??  "Choose Category").uppercased()
        chooseCategoryLabel.font = UIFont.CustomFont(.medium, size: 10)
        chooseCategoryLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        chooseCategoryLabel.textAlignment = .center
    }

    private func configureAddButtonCategory() {
        if (viewData?.isShowButton ?? true) {
            addCategoryButton.cornerRadius = 4
            addCategoryButton.borderWidth = 1
            addCategoryButton.borderColor = UIColor(named: AssetColor.borderColor)
            addCategoryButton.setTitle("Add new category", for: .normal)
            addCategoryButton.addTarget(self, action: #selector(onTap), for: .touchUpInside) } else { addCategoryButton.removeFromSuperview()}
    }

    private func configureCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: identifer)
    }
    @objc private func onTap(){
    
        if let onTapAddCategory = categoryViewModel.onClickAddCategory{
            onTapAddCategory()
        }
    }
}

// MARK: Delegate && DataSource

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return categoryViewModel.listCategory?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! CategoryCollectionViewCell

        if let listCategory = categoryViewModel.listCategory {
          
            cell.configure(viewData: CategoryCollectionViewCell.ViewData(categoryName: listCategory[indexPath.row].categoryName, iconUrl: listCategory[indexPath.row].media?.iconUrl, iconBackgroundColor: listCategory[indexPath.row].media?.backgroundColor,isShowCategoryName: viewData?.isShowCategoryName))
        }

        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryViewModel.choosenCategoryCallBack?(categoryViewModel.listCategory?[indexPath.row])
        print("===OnClick====")
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }

}
