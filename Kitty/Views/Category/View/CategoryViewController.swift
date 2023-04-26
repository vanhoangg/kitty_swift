//
//  CategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var addCategoryButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var chooseCategoryLabel: UILabel!
    // MARK: Properties
    let identifer = "categoryCell"
    let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: .main)
    var categoryViewModel :CategoryViewModel = CategoryViewModel()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
   
}
// MARK: Method
extension CategoryViewController {
    private func build(){
        configureChooseCategoryLabel()
        configureAddButtonCategory()
        configureCategoryCollectionView()
    }
    private func configureChooseCategoryLabel(){
        self.chooseCategoryLabel.text = "Choose Category".uppercased()
        self.chooseCategoryLabel.font = UIFont.CustomFont(.medium,size: 10)
        self.chooseCategoryLabel.textColor = UIColor(named: AssetColor.SecondaryTextColor)
        self.chooseCategoryLabel.textAlignment = .center
    }
    private func configureAddButtonCategory(){
        self.addCategoryButton.cornerRadius = 4
        self.addCategoryButton.borderWidth    = 1
        self.addCategoryButton.borderColor    = UIColor(named: AssetColor.borderColor)
        self.addCategoryButton.setTitle("Add new category", for: .normal)
    }
    private func configureCategoryCollectionView(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: identifer)
    }
}
// MARK: Delegate && DataSource
extension CategoryViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.listCategory?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! CategoryCollectionViewCell
        
        if let listCategory = categoryViewModel.listCategory {
            cell.configure(viewData: CategoryCollectionViewCell.ViewData(categoryName: listCategory[indexPath.row].categoryName, iconUrl: listCategory[indexPath.row].iconUrl,iconBackgroundColor:listCategory[indexPath.row].colorBackground ))
        }
     
        return cell
    }
    
    
}
