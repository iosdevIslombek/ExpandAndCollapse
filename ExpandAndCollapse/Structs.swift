//
//  Structs.swift
//  ExpandAndCollapse
//
//  Created by Islomjon on 17/05/22.
//

import Foundation
import UIKit

struct CategoryDM{
    var categoryName:String
    var subTasks:[Task]
    var isExpand:Bool
    var categoryIndex:IndexPath
}

struct Task{
    var taskName:String
    var taskIndex:IndexPath
}
