//
//  CategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryViewController: UIViewController {
    // MARK: IBOutlet

    @IBOutlet var addCategoryButton: UIButton!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var chooseCategoryLabel: UILabel!

    // MARK: Properties
    let identifer = "categoryCell"
    let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: .main)
    var categoryViewModel = CategoryViewModel()

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
        configureChooseCategoryLabel()
        configureAddButtonCategory()
        configureCategoryCollectionView()
    }

    private func configureChooseCategoryLabel() {
        chooseCategoryLabel.text = "Choose Category".uppercased()
        chooseCategoryLabel.font = UIFont.CustomFont(.medium, size: 10)
        chooseCategoryLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        chooseCategoryLabel.textAlignment = .center
    }

    private func configureAddButtonCategory() {
        addCategoryButton.cornerRadius = 4
        addCategoryButton.borderWidth = 1
        addCategoryButton.borderColor = UIColor(named: AssetColor.borderColor)
        addCategoryButton.setTitle("Add new category", for: .normal)
    }

    private func configureCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: identifer)
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
            cell.configure(viewData: CategoryCollectionViewCell.ViewData(categoryName: listCategory[indexPath.row].categoryName, iconUrl: listCategory[indexPath.row].iconUrl, iconBackgroundColor: listCategory[indexPath.row].colorBackground))
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
