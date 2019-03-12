//
//  Node.swift
//  AlgoTree
//
//  Created by Admin on 2019/3/8.
//  Copyright © 2019年 Admin. All rights reserved.
//

import Foundation

class Node
{
//    var parent: Node?
    var left: Node?
    var right: Node?
    var value: Int
    var isPick = false
    var hasBeenLeft = false
    var hasBeenRight = false
    
    init(left: Node?, right: Node?, value: Int)
    {
//        self.parent = parent
        self.left = left
        self.right = right
        self.value = value
    }
}
