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
    
    private func build() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: bounds.height))
        leftView = paddingView
        rightView = paddingView
        
        leftViewMode = .always
        rightViewMode = .always
        borderColor = UIColor(named: AssetColor.borderColor)
        
        textColor = UIColor(named: AssetColor.PrimaryTextColor)
        font = UIFont.CustomFont(.regular, size: 16)
    }
}
class CurrencyTextField: CustomTextField {
    //1
    var passTextFieldText: ((String, Double?) -> Void)?
    
    //2
    
    //Used to send clean double value back
    private var amountAsDouble: Double?
    
    var startingValue: Double? {
        didSet {
            let nsNumber = NSNumber(value: startingValue ?? 0.0)
            self.text = numberFormatter.string(from: nsNumber)
        }
    }
    
    //3
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_IN") // Here indian locale with english language is used
        formatter.numberStyle = .currency
        formatter.currencySymbol = " ₹"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        //locale and currencyCode set in currency property observer
        return formatter
    }()
    
    //4
    private var roundingPlaces: Int {
        return numberFormatter.maximumFractionDigits
    }
    
    //5
    private var isSymbolOnRight = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //If using in SBs
        setup()
    }
    
    //6
    private func setup() {
        self.keyboardType = .numberPad
        self.contentScaleFactor = 0.5
        delegate = self
        
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    //AFTER entered string is registered in the textField
    @objc private func textFieldDidChange() {
        updateTextField()
    }
    
    //7
    //Placed in separate method so when the user selects an account with a different currency, it will immediately be reflected
    private func updateTextField() {
        var cleanedAmount = ""
        
        for character in self.text ?? "" {
            if character.isNumber {
                cleanedAmount.append(character)
            }
        }
        
        if isSymbolOnRight {
            cleanedAmount = String(cleanedAmount.dropLast())
        }
        
        //Format the number based on number of decimal digits
        if self.roundingPlaces > 0 {
            //ie. USD
            let amount = Double(cleanedAmount) ?? 0.0
            amountAsDouble = (amount / 100.0)
            let amountAsString = numberFormatter.string(from: NSNumber(value: amountAsDouble ?? 0.0)) ?? ""
            
            self.text = amountAsString
        } else {
            //ie. JPY
            let amountAsNumber = Double(cleanedAmount) ?? 0.0
            amountAsDouble = amountAsNumber
            self.text = numberFormatter.string(from: NSNumber(value: amountAsNumber)) ?? ""
        }
        
        passTextFieldText?(self.text!, amountAsDouble)
    }
    
    //8
    //Prevents the user from moving the cursor in the textField
    //Source: https://stackoverflow.com/questions/16419095/prevent-user-from-setting-cursor-position-on-uitextfield
    override func closestPosition(to point: CGPoint) -> UITextPosition? {
        let beginning = self.beginningOfDocument
        let end = self.position(from: beginning, offset: self.text?.count ?? 0)
        return end
    }
}


extension CurrencyTextField: UITextFieldDelegate {
    
    //9
    //BEFORE entered string is registered in the textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let lastCharacterInTextField = (textField.text ?? "").last
        
        //Note - not the most straight forward implementation but this subclass supports both right and left currencies
        if string == "" && lastCharacterInTextField!.isNumber == false {
            //For hitting backspace and currency is on the right side
            isSymbolOnRight = true
        } else {
            isSymbolOnRight = false
        }
        
        return true
    }
}
