//
//  Extension.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import RealmSwift
import UIKit



extension Date{
    func toString(pattern:String? = "dd-MM-yyyy") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
extension Results {
    func toArray<T>(ofType _: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}

extension UIView {

    func removeAllSubViews() {
        _ = self.subviews.map({ view in
            view.removeFromSuperview()
        })
    }
}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random,
            green: .random,
            blue: .random,
            alpha: 1.0
        )
    }
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            // Cache this, NumberFormatter creation is expensive.
            formatter.locale = Locale(identifier: "en_US") // Here indian locale with english language is used
            formatter.numberStyle = .currency
            formatter.currencySymbol = " ₹ "
//            formatter.minimumFractionDigits = 0
            
            
            formatter.maximumFractionDigits = 0
            // Change to `.currency` if needed
            if let str = formatter.string(from: NSNumber(value: value)) {
                return str
            }
        }
        return ""
    }
}

@IBDesignable public class RoundedUIView: UIView {
    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
