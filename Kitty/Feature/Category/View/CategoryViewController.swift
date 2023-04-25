//
//  CategoryViewController.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CategoryViewController: UIViewController {
    let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: .main)
    let identifer = "categoryCell"
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    let categoryViewModel = CategoryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: identifer)
        // Do any additional setup after loading the view.
    }

}
extension CategoryViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.listCategory?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! CategoryCollectionViewCell
        let listCategory = categoryViewModel.listCategory
        cell.configure(viewData: CategoryCollectionViewCell.ViewData(categoryName: listCategory?[indexPath.row].categoryName, iconUrl: listCategory?[indexPath.row].iconUrl,iconBackgroundColor:listCategory?[indexPath.row].colorBackground ))
        return cell
    }
    
    
}
