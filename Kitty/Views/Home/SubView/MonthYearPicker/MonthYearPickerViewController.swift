//
//  MonthYearPickerViewController.swift
//  Kitty
//
//  Created by hoang.dinh on 5/8/23.
//

import UIKit

class MonthYearPickerViewController: UIViewController {
    // MARK: - Properties

    let identifer = "MonthYearPickerCell"
    @IBOutlet var monthCollectionView: UICollectionView!
    lazy var monthYearPickerViewModel: MonthYearPickerProtocol = MonthYearPickerViewModel()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }

    // MARK: - Method

    private func build() {
        configureMonthCollectionView()
    }

    private func configureMonthCollectionView() {
        monthCollectionView.delegate = self

        monthCollectionView.dataSource = self
        monthCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifer)
    }
}

// MARK: - UICollectionDelegateFlowLayout

extension MonthYearPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = (collectionView.bounds.width) / 4.0
        let yourHeight = yourWidth / 2

        return CGSize(width: yourWidth, height: yourHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 22, bottom: 16, right: 22)
    }
}

// MARK: - UICollectionViewDelegate , UICollectionViewDataSource

extension MonthYearPickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return monthYearPickerViewModel.listMonth.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath)
        if monthYearPickerViewModel.listMonth[indexPath.row] == monthYearPickerViewModel.selectedMonth {
            cell.backgroundColor = .systemBlue
        }
        cell.cornerRadius = 6
        cell.borderColor = UIColor(named: AssetColor.borderColor)
        cell.borderWidth = 1
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
        title.text = monthYearPickerViewModel.listMonth[indexPath.row].title()
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("===OnClick====")
        monthYearPickerViewModel.callback?(monthYearPickerViewModel.listMonth[indexPath.row])
        //        monthCollectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension MonthYearPickerViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .popover
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
}
