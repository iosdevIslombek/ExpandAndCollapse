//
//  BigTVC.swift
//  ExpandAndCollapse
//
//  Created by Islomjon on 17/05/22.
//

import UIKit

protocol BigTVCDelegate {
    func minusTapped(index:IndexPath)
    func plusTapped(index:IndexPath)
    func switchChanged(index:IndexPath, isOn:Bool)
}

class BigTVC: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    var delegate:BigTVCDelegate?
    var index:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        delegate?.minusTapped(index: self.index)
    }
    @IBAction func plusTapped(_ sender: Any) {
        delegate?.plusTapped(index: self.index)
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        delegate?.switchChanged(index: self.index, isOn: switchBtn.isOn)
    }
    
    func updateBigCell(category:CategoryDM){
        nameLbl.text = category.categoryName
        switchBtn.isOn = category.isExpand
        self.index = category.categoryIndex
    }
}
