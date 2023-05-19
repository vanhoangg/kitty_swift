//
//  CustomHeaderView.swift
//  Kitty
//
//  Created by hoang.dinh on 5/17/23.
//

import UIKit

class CustomHeaderView: UIView {
    // MARK: - Properties
    @IBOutlet weak var calendarView: UIView!
    let nibName = "CustomHeaderView"
    var headerView: UIView = UIView()
    @IBOutlet weak var calendarLabel: UILabel!

    struct ViewData {
        var onTapGestureDetecture: ((_ monthYearPickerViewController: MonthYearPickerViewController) -> Void)?
        let datePicker: Date?

    }
    var viewData: ViewData?
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
        bindData()

    }
    required init(viewData: ViewData?) {
        super.init(frame: CGRect.zero)
        self.viewData = viewData
        bindData()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        build()
        bindData()
    }
    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }

    func configureData(_ viewData: ViewData?) {
        self.viewData = viewData
        bindData()
    }
    // MARK: - Private func
    private func build() {
        configCalendarView()
    }
    private func bindData() {
        calendarLabel.text = viewData?.datePicker?.toString(pattern: StringUtils.stringMonthYearPatternDate)

//      Date().toString(pattern:StringUtils.stringMonthYearPatternDate)

    }
    private func configCalendarView() {
        headerView = loadViewFromNib()
        headerView.frame = self.bounds
        headerView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(headerView)
        calendarView.cornerRadius = calendarView.frame.height * 0.375
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        calendarView.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
    }

    @objc private func onTap() {
        let monthYearPicker = MonthYearPickerViewController()
        monthYearPicker.modalPresentationStyle = .popover
        monthYearPicker.preferredContentSize = CGSize(width: screenWidth, height: screenWidth * 0.8)
        monthYearPicker.popoverPresentationController?.delegate = self
        monthYearPicker.popoverPresentationController?.sourceView = calendarView
        self.viewData?.onTapGestureDetecture?(monthYearPicker)
    }

}
// MARK: - UIPopoverPresentationControllerDelegate

extension CustomHeaderView: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.permittedArrowDirections = .unknown
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        Log.w("Popover Dismissed!")
    }
}
