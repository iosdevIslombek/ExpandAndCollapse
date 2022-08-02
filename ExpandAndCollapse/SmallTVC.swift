//
//  SmallTVC.swift
//  ExpandAndCollapse
//
//  Created by Islomjon on 17/05/22.
//

import UIKit

class SmallTVC: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateSmallCell(task:Task){
        lbl.text = task.taskName
    }
}
