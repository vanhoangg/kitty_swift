//
//  ProfileViewController.swift
//  Kitty
//
//  Created by Doan Ho on 29/05/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    lazy var profileViewModel:ProfileViewModel = {
        return ProfileViewModel()
    }()
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// config appbar
        navigationItem.title = "Profile"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.shadowColor = UIColor(white: 0.0, alpha: 0.5)
        //        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationItem.leftItemsSupplementBackButton = true
        /// add button left
        let btnLeft = UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(touchBtnLeft))
        btnLeft.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .normal)
        self.navigationItem.leftBarButtonItem = btnLeft
        /// add button right
        let btnRight = UIBarButtonItem(image: UIImage(named: AssetIcon.icHealth), style: .plain, target: self, action: #selector(touchBtnLeft))
        btnRight.tintColor = .white
        self.navigationItem.rightBarButtonItem = btnRight
        /// config view
        self.view.backgroundColor = .white
        let guide = view.safeAreaLayoutGuide
        let newView = UIView()
        newView.frame = view.frame
        self.view.addSubview(newView)
        //        newView.translatesAutoresizingMaskIntoConstraints = false
        //        if #available(iOS 11.0, *){
        //            newView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        //            newView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        //            newView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        //            newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        }else{
        //            NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        //            NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        //            NSLayoutConstraint(item: newView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        //            newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        }
        /// label
        let text = UILabel()
        text.frame = CGRect(x: 0, y: 0, width: newView.frame.width, height: 200)
        text.text = "Couter Demo"
        newView.addSubview(text)
        /// view couter
        let couterView = UIView(frame: CGRect(x: 0, y: 200, width: newView.frame.width, height: 60))
        couterView.backgroundColor = .white
        // button minus
        let btnDecrement = UIButton(frame: CGRect(x: 40, y: 0, width: 60, height: 60))
        let imgDe = UIImage(systemName: "minus")?.image(size: CGSize(width: 60, height: 30))
        imgDe?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        btnDecrement.setBackgroundImage(imgDe, for: .normal)
        btnDecrement.tintColor = .red
        btnDecrement.contentMode = .scaleAspectFit
        btnDecrement.clipsToBounds = true
        btnDecrement.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        // button plus
        let btnIncrement = UIButton(frame: CGRect(x: couterView.frame.width - 100, y: 0, width: 60, height: 60))
        let imgIn = UIImage(systemName: "plus")?.image(size: CGSize(width: 60, height: 30))
        imgIn?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        btnIncrement.setBackgroundImage(imgIn, for: .normal)
        btnIncrement.tintColor = .red
        btnIncrement.contentMode = .scaleAspectFit
        btnIncrement.clipsToBounds = true
        btnIncrement.addTarget(self, action: #selector(increment), for: .touchUpInside)
        // view
        let couterText = UILabel()
        couterText.frame = CGRect(x: (couterView.frame.width / 2) - 30, y: 0, width: 60, height: 60)
        couterText.textColor = .darkText
        couterText.font = UIFont.boldSystemFont(ofSize: 16)
        couterText.textAlignment = .center
        couterText.text = "\(self.profileViewModel.couter)"
        
        profileViewModel.callback = {
            print("call back")
            DispatchQueue.main.async {
                couterText.text = "\(self.profileViewModel.couter)"
            }
        }
        
        couterView.addSubview(btnIncrement)
        couterView.addSubview(btnDecrement)
        couterView.addSubview(couterText)
        
        newView.addSubview(couterView)
        
        /// UICouter
        let uiCouter = UICouter()
        uiCouter.frame = CGRect(x: 0, y: 260, width: view.frame.width, height: 200)
        uiCouter.backgroundColor = .red
        uiCouter.configure(config: .init(imageIncrement: UIImage(systemName: "plus")?.image(size: CGSize(width: 60, height: 30)), imageDecrement: UIImage(systemName: "minus")?.image(size: CGSize(width: 60, height: 30)),colorIncrement: .red, target: self, actionIncrement: #selector(increment), actionDecrement: #selector(decrement), controlEvents: .touchUpInside))
        
        newView.addSubview(uiCouter)
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            newView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            newView.widthAnchor.constraint(equalTo: newView.heightAnchor, multiplier: 1, constant: 0),
//            newView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
//            ])

    }
    
    @objc func touchBtnLeft(){
        
    }
    
    @objc func increment(){
        profileViewModel.increment()
    }
    @objc func decrement(){
        profileViewModel.decrement()
    }
    
}

extension UIImage{
    func image(size: CGSize)->UIImage{
        let image = UIGraphicsImageRenderer(size: size).image{
            _ in draw(in: CGRect(origin: .zero, size: size))
        }
        return image.withRenderingMode(.alwaysOriginal)
    }
}

class UICouter: UIView{
    struct UICouterConfig{
        let imageIncrement: UIImage?
        let imageDecrement: UIImage?
        var colorIncrement: UIColor = .blue
        var colorDecrement: UIColor? = .red
        var initValue: String = "0"
        let target: Any?
        let actionIncrement: Selector
        let actionDecrement: Selector
        let controlEvents: UIControl.Event
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        build()
    }
    
    private let incrementBtnView: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        let img = UIImage(systemName: "plus")?.image(size: CGSize(width: 60, height: 30))
        img?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(img, for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    
    private let decrementBtnView: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        let img = UIImage(systemName: "minus")?.image(size: CGSize(width: 60, height: 30))
        img?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(img, for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    
    private let couterView: UILabel = {
        let couterText = UILabel()
        couterText.sizeToFit()
        couterText.textColor = .darkText
        couterText.font = UIFont.boldSystemFont(ofSize: 16)
        couterText.textAlignment = .center
        return couterText
    }()
    
    func configure(config: UICouterConfig){
        couterView.text = config.initValue
        incrementBtnView.tintColor = config.colorIncrement
        incrementBtnView.setBackgroundImage(config.imageIncrement, for: .normal)
        incrementBtnView.addTarget(config.target, action: config.actionIncrement, for: config.controlEvents)
        decrementBtnView.tintColor = config.colorDecrement
        decrementBtnView.setBackgroundImage(config.imageDecrement, for: .normal)
        decrementBtnView.addTarget(config.target, action: config.actionDecrement, for: config.controlEvents)
    }
    
    
}

extension UICouter{
    private func build(){
        buildDecrement()
        buildCouterView()
        buildIncrement()
    }
    private func buildIncrement(){
        addSubview(incrementBtnView)
        incrementBtnView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incrementBtnView.centerYAnchor.constraint(equalTo: centerYAnchor),
            incrementBtnView.widthAnchor.constraint(equalTo: incrementBtnView.heightAnchor, multiplier: 1, constant: 0),
            incrementBtnView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            
        ])
    }
    
    private func buildDecrement(){
        addSubview(decrementBtnView)
        decrementBtnView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            decrementBtnView.centerYAnchor.constraint(equalTo: centerYAnchor),
            decrementBtnView.widthAnchor.constraint(equalTo: decrementBtnView.heightAnchor, multiplier: 1, constant: 0),
            decrementBtnView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            
        ])
    }
    
    private func buildCouterView(){
        addSubview(couterView)
        couterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            couterView.centerYAnchor.constraint(equalTo: centerYAnchor),
            couterView.widthAnchor.constraint(equalTo: couterView.heightAnchor, multiplier: 1, constant: 0),
            couterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
            
        ])
    }
}
