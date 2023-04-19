//
//  ExpenseDetailTableView.swift
//  Kitty
//
//  Created by Dinh Van Hoang on 19/04/2023.
//
import UIKit

class ExpenseDetailTableView: UITableView , UITableViewDelegate , UITableViewDataSource {
    
    
        
   
    
    var items: [String] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    override var contentSize: CGSize {
            didSet {
                invalidateIntrinsicContentSize()
                setNeedsLayout()
            }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ExpenseDetailTableViewCell = (tableView.dequeueReusableCell(withIdentifier:ExpenseDetailTableViewCell.identifer,for: indexPath)) as! ExpenseDetailTableViewCell
       
        cell.contentLabel.text = items[indexPath.row]
        return cell
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .plain)
        

        initExpenseDetailTableView()
         
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initExpenseDetailTableView()

    }
    private func initExpenseDetailTableView(){
        register(ExpenseDetailTableViewCell.nib(), forCellReuseIdentifier: ExpenseDetailTableViewCell.identifer)
        delegate = self
        dataSource = self
        separatorStyle = .none
    }

}
