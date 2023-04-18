//
//  ExpenseTableView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 18/04/2023.
//

import UIKit

class ExpenseTableView: UITableView , UITableViewDelegate , UITableViewDataSource {
    
    
    var items = ["a","b","c","d","e","f","g","hh","t","x","y","z","s","a"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, sectionHeaderHeight section: Int) -> Int {
        return 50
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath))
        cell.textLabel?.text = items[indexPath.section]
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .plain)
        register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        delegate = self
        dataSource = self
        separatorStyle = .none
         // Frame là zero cũng không sao vì mình sẽ autolayout cho nó sau, và set style là grouped
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
