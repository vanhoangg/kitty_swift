import UIKit

struct IconTextButtonViewData {
    let text: String
    let image: UIImage? = UIImage()
    let backgroundColor: UIColor? = .clear
}

class IconTextButton: UIButton {
    struct IconTextButtonViewData {
        let text: String
        let image: UIImage?
        let backgroundColor: UIColor? = .clear
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        return imageView
    }()

    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont(name: "Inter-Medium", size: 14)
        return label
    }()

    func configure(viewData: IconTextButtonViewData) {
        buttonLabel.text = viewData.text
        iconImageView.image = viewData.image
    }
}

extension IconTextButton {
    func loadData() {}

    func configureStyle(cornerRadius: CGFloat = 4, borderWidth: CGFloat = 1, borderColor: String = AssetColor.borderColor, backgroundColor: UIColor? = .clear, textColor: UIColor? = UIColor(named: "24"), font: UIFont = UIFont.CustomFont(.regular, size: 14)) {
        //        setTitle("ABCXYZ", for: .normal)
        self.backgroundColor = backgroundColor
        buttonLabel.font = font
        buttonLabel.textColor = textColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(named: borderColor)?.cgColor
    }

    private func build() {
        buildLeadingIcon()
        buildLabel()
        configureStyle()
    }

    private func buildLeadingIcon() {
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1, constant: 0),
            //            iconImageView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 16/248,constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }

    private func buildLabel() {
        addSubview(buttonLabel)
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 6),
            buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
