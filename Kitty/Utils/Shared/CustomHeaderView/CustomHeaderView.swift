//
//  CustomHeaderView.swift
//  Kitty
//
//  Created by hoang.dinh on 5/17/23.
//

import UIKit

class CustomHeaderView: UIView {
    @IBOutlet weak var calendarView: UIView!
    let nibName = "CustomHeaderView"
    var headerView: UIView = UIView()
    @IBOutlet weak var calendarLabel: UILabel!
    struct ViewData {
        var onTapGestureDetecture: (() -> Void)?
        let datePickerText: String?
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

    private func build() {
        configCalendarView()
    }
    private func bindData() {
        calendarLabel.text = viewData?.datePickerText
//      Date().toString(pattern:StringUtils.stringMonthYearPatternDate)

    }
    func configureData(_ viewData: ViewData?) {
        self.viewData = viewData
        bindData()
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
    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    @objc private func onTap() {
        self.viewData?.onTapGestureDetecture?()
    }
}
