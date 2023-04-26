//
//  CustomTextField.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 25/04/2023.
//

import UIKit

class CustomTextField: UITextField {

   // MARK: Floating Custom
//    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
//    var floatingLabelHeight: CGFloat = 14 // Default height
//    @IBInspectable
//    var _placeholder: String? // we cannot override 'placeholder'
//    @IBInspectable
//    var floatingLabelColor: UIColor = UIColor.blue {
//        didSet {
//            self.floatingLabel.textColor = floatingLabelColor
//            self.setNeedsDisplay()
//        }
//    }
//    @IBInspectable
//    var activeBorderColor: UIColor = UIColor.blue
//    @IBInspectable
//    var floatingLabelFont: UIFont = UIFont.CustomFont(.regular,size:16) {
//        didSet {
//            self.floatingLabel.font = self.floatingLabelFont
//            self.font = self.floatingLabelFont
//            self.setNeedsDisplay()
//        }
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder // Use our custom placeholder if none is set
//        placeholder = self._placeholder // make sure the placeholder is shown
//        self.floatingLabel = UILabel(frame: CGRect.zero)
//        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
//        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
//    }
//    @objc func addFloatingLabel() {
//        if self.text == "" {
//            self.floatingLabel.textColor = floatingLabelColor
//            self.floatingLabel.font = floatingLabelFont
//            self.floatingLabel.text = self._placeholder
//            self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
//            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
//            self.floatingLabel.clipsToBounds = true
//            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
//    self.layer.borderColor = self.activeBorderColor.cgColor
//            self.addSubview(self.floatingLabel)
//
//            self.floatingLabel.bottomAnchor.constraint(equalTo:
//            self.topAnchor, constant: -5).isActive = true // Place our label 10pts above the text field
//            // Remove the placeholder
//            self.placeholder = ""
//        }
//        self.setNeedsDisplay()
//    }
//    @objc func removeFloatingLabel() {
//        if self.text == "" {
//            UIView.animate(withDuration: 0.13) {
//               self.subviews.forEach{ $0.removeFromSuperview() }
//               self.setNeedsDisplay()
//            }
//            self.placeholder = self._placeholder
//        }
//        self.layer.borderColor = UIColor.black.cgColor
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            build()
           
        }
        
    private func build(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.bounds.height))
        self.leftView = paddingView;
        self.rightView = paddingView;
        self.leftViewMode = .always;
        self.rightViewMode = .always;
        self.borderColor = UIColor(named: AssetColor.borderColor)
        
        self.textColor = UIColor(named: AssetColor.PrimaryTextColor)
        self.font = UIFont.CustomFont(.regular,size: 16)
    }
    
}
