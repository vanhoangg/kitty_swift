//
//  CustomHorizontalChartView.swift
//  Kitty
//
//  Created by hoang.dinh on 5/16/23.
//

import UIKit

class CustomHorizontalChartView: UIView {
    var listPercentItems: [Int] = []
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    required init(listPercentItems: [Int] = []) {
        super.init(frame: CGRect.zero)
        self.listPercentItems = listPercentItems
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        var previousWidthItem: CGFloat = 0
        for index in 0..<listPercentItems.count {
            let color: UIColor = UIColor.random()
            let widthItem = rect.width * (CGFloat(listPercentItems[index]) / 100 )
            if index != 0 { previousWidthItem += rect.width * (CGFloat(listPercentItems[index-1]) / 100 )}
            let drect = CGRect(x: previousWidthItem, y: 0, width: widthItem, height: rect.height)
            let path = UIBezierPath(rect: drect)
            color.setFill()
            path.fill()
        }
        NSLog("drawRect has updated the view")

    }

}
