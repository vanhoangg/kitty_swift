//
//  MonthYearPickerViewController.swift
//  Kitty
//
//  Created by hoang.dinh on 5/8/23.
//

import UIKit

class MonthYearPickerViewController: UIViewController {
    let identifer = "MonthYearPickerCell"
    @IBOutlet weak var monthCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        
        // Do any additional setup after loading the view.
    }
    private func build(){
        configureMonthCollectionView()
    }
    private func configureMonthCollectionView(){
        monthCollectionView.delegate = self
        monthCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifer)
        monthCollectionView.dataSource = self
    }
}
extension MonthYearPickerViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = (collectionView.bounds.width ) / 4.0
        let yourHeight = yourWidth/2

        return CGSize(width: yourWidth, height: yourHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 16, left: 22, bottom: 16, right: 22)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath)
        
        
        cell.cornerRadius = 6
        cell.borderColor = UIColor(named: AssetColor.borderColor)
        cell.borderWidth = 1
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("===OnClick====")
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    
    
}
extension MonthYearPickerViewController: UIPopoverPresentationControllerDelegate {
    // 1
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .popover
    }
    

    // 2
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
}

