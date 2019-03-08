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
    let parent: Node?// = nil
    let left: Node?// = nil
    let right: Node?// = nil
    let value: Int
    
    init(parent: Node?, left: Node?, right: Node?, value: Int)
    {
        self.parent = parent
        self.left = left
        self.right = right
        self.value = value
    }
}
