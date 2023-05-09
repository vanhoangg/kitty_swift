//
//  MediaCategoryViewController.swift
//  Kitty
//
//  Created by hoang.dinh on 5/5/23.
//

import UIKit

class MediaCategoryViewController: UIViewController {
    let identifer:String = "MediaCategoryViewCell"
    // MARK: properties
    lazy var mediaCategoryViewModel : MediaCategoryProtocol =
    {
        
        return MediaCategoryViewModel()
    }()
    @IBOutlet weak var mediaCategoryCollectionView: UICollectionView!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Method
    private func build(){
        configureMediaCategoryCollectionView()
    }

    private func configureMediaCategoryCollectionView(){
        mediaCategoryCollectionView.delegate = self
        mediaCategoryCollectionView.dataSource = self
        mediaCategoryCollectionView.register(CategoryCollectionViewCell.nib, forCellWithReuseIdentifier: identifer)
    }
}
extension MediaCategoryViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = (collectionView.bounds.width ) / 3.0
        let yourHeight = yourWidth/2

        return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as! CategoryCollectionViewCell
        
        if let itemIndexCategory = mediaCategoryViewModel.listData?[indexPath.row] {
            let mediaCategoryCollectionViewData = CategoryCollectionViewCell.ViewData(
               iconUrl: itemIndexCategory.iconUrl,
                iconBackgroundColor: itemIndexCategory.backgroundColor,
                isShowCategoryName: false)
            cell.configure(viewData: mediaCategoryCollectionViewData)
        }
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mediaCategoryViewModel.chooseIconCategoryCallBack?(mediaCategoryViewModel.listData?[indexPath.row])
        print("===OnClick====")
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
}
