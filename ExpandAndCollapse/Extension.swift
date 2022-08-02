//
//  Extension.swift
//  ExpandAndCollapse
//
//  Created by Islomjon on 17/05/22.
//

import Foundation
import UIKit

extension UITableView{
    func setBackground(count:Int){
        if count > 0{
            self.backgroundView = nil
        }else{
            let lbl = UILabel(frame: CGRect(x: 0,
                                            y: 0,
                                            width: self.frame.width,
                                            height: self.frame.height))
            lbl.font = .italicSystemFont(ofSize: 30)
            lbl.textAlignment = .center
            lbl.text = "No Tasks!!!"
            lbl.textColor = .systemGray3
            self.backgroundView = lbl
        }
    }
}
