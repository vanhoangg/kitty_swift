import UIKit

struct IconTextButtonViewData{
    let text:String
    let image:UIImage?
    let backgroundColor:UIColor? = .clear
    
    
}
class IconTextButton: UIButton {
    
    struct IconTextButtonViewData{
        let text:String
        let image:UIImage?
        let backgroundColor:UIColor? = .clear
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
        configureStyle()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
        configureStyle()
    }
    private let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        return imageView
    }()
    private let buttonLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font     = UIFont(name: "Inter-Medium", size: 14)
        return label
    }()
    func configure(viewData : IconTextButtonViewData){
        buttonLabel.text = viewData.text
        iconImageView.image = viewData.image
    }
    
}
extension IconTextButton {
    func loadData(){
        
    }
    func configureStyle(cornerRadius:CGFloat = 4,borderWidth:CGFloat = 1 ,borderColor:String = AssetColor.borderColor,backgroundColor:UIColor? = .clear,textColor:UIColor? = UIColor(named:"24"),font:UIFont = UIFont.CustomFont(.regular, size: 14)){
        
        
        //        setTitle("ABCXYZ", for: .normal)
        self.backgroundColor      = backgroundColor
        buttonLabel.font     = font
        buttonLabel.textColor = textColor
        layer.cornerRadius   = cornerRadius
        layer.borderWidth    = borderWidth
        layer.borderColor    = UIColor(named: borderColor)?.cgColor
    }
    private func build() {
        
        
        addSubview(iconImageView)
        addSubview(buttonLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor,multiplier: 1,constant: 0),
            //            iconImageView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 16/248,constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo:self.leadingAnchor,constant: 20),
            
            buttonLabel.leadingAnchor.constraint(equalTo:iconImageView.trailingAnchor,constant: 6),
            
            buttonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            //            buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
        ])
    }
    
    func setShadow() {
        
        let layer1 = CALayer(), layer2 = CALayer(), layer3 = CALayer()
        
        [layer1, layer2, layer3].forEach {
            
            $0.frame = layer.bounds
            layer.insertSublayer($0, at: 0)
        }
        layer1.applySketchShadow(color: .black, alpha: 0.2, x: 0, y: 1, blur: 8, spread: 0)
        layer2.applySketchShadow(color: .black, alpha: 0.12, x: 0, y: 3, blur: 3, spread: 0)
        layer3.applySketchShadow(color: .black, alpha: 0.14, x: 0, y: 3, blur: 4, spread: 0)
        //        layer.shadowColor   = UIColor.black.cgColor
        //        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        //        layer.shadowRadius  = 8
        //        layer.shadowOpacity = 0.5
        clipsToBounds       = true
//                layer1.masksToBounds = false
//        layer2.masksToBounds = false
//        layer3.masksToBounds = false
        
        
    }
    
}
