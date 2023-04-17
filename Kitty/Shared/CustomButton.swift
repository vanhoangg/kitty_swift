import UIKit

struct IconTextButtonViewModel{
    let text:String
    let image:UIImage?
    let backgroundColor:UIColor? = .clear
    
    
}
class IconTextButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
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
    func configuration(with viewModel : IconTextButtonViewModel){
        buttonLabel.text = viewModel.text
        iconImageView.image = viewModel.image
    }
    private func setupButton() {
        updateButtonView()
        styleButton()
        
    }
   
}
extension IconTextButton {
    private func styleButton(){
        
//        setTitleColor(UIColor(named:"24"), for: .normal)
//        setTitle("ABCXYZ", for: .normal)
//        backgroundColor      = .clear
//        titleLabel?.font     = UIFont(name: "Inter-SemiBold", size: 14)
        layer.cornerRadius   = 4
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor(named: "Border")?.cgColor
    }
    private func updateButtonView() {
        
        
        addSubview(iconImageView)
        addSubview(buttonLabel)
      
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor,multiplier: 1,constant: 0),
//            iconImageView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 16/248,constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo:self.leadingAnchor,constant: 16),
            
            buttonLabel.leadingAnchor.constraint(equalTo:iconImageView.trailingAnchor,constant: 16),
            
            buttonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            

        ])
    }
    
    private func setShadow() {
        
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
  
}
