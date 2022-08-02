//
//  MainVC.swift
//  ExpandAndCollapse
//
//  Created by Islomjon on 17/05/22.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var expandBtn: UIBarButtonItem!
    
    var categories:[CategoryDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "BigTVC", bundle: nil), forCellReuseIdentifier: "BigTVC")
        tableView.register(UINib(nibName: "SmallTVC", bundle: nil), forCellReuseIdentifier: "SmallTVC")
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        if categories.count > 0 {
            categories.removeLast()
            tableView.reloadData()
        }
    }
    @IBAction func plusTapped(_ sender: Any) {
        let category = CategoryDM(categoryName: "\(categories.count+1)", subTasks: [], isExpand: false, categoryIndex: IndexPath(row: 0, section: 0))
        categories.append(category)
        tableView.reloadData()
    }
    @IBAction func expendTapped(_ sender: UIBarButtonItem) {
        for index in 0..<categories.count{
            categories[index].isExpand = sender.title == "Expand"
        }
        sender.title = sender.title == "Expand" ? "Collapse" : "Expand"
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -

extension MainVC:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.setBackground(count: categories.count)
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categories[section].isExpand{
            return categories[section].subTasks.count+1
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let bigCell = tableView.dequeueReusableCell(withIdentifier: "BigTVC", for: indexPath) as! BigTVC
            categories[indexPath.section].categoryIndex = indexPath
            bigCell.updateBigCell(category: categories[indexPath.section])
            bigCell.delegate = self
            return bigCell
        }else{
            if categories[indexPath.section].isExpand{
                let smallCell = tableView.dequeueReusableCell(withIdentifier: "SmallTVC", for: indexPath) as! SmallTVC
                smallCell.updateSmallCell(task: categories[indexPath.section].subTasks[indexPath.row-1])
                return smallCell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - BigTVCDelegate -
extension MainVC:BigTVCDelegate{
    func plusTapped(index: IndexPath) {
        let task = Task(taskName: "\(categories[index.section].subTasks.count+1)", taskIndex: index)
        categories[index.section].subTasks.append(task)
        tableView.reloadData()
    }
    func minusTapped(index: IndexPath) {
        if categories[index.section].subTasks.count > 0{
            categories[index.section].subTasks.removeLast()
            tableView.reloadData()
        }
    }
    func switchChanged(index: IndexPath, isOn: Bool) {
        categories[index.section].isExpand = isOn
        tableView.reloadData()
    }
}
