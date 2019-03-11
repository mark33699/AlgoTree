//
//  CompareViewController.swift
//  AlgoTree
//
//  Created by Admin on 2019/3/8.
//  Copyright © 2019年 Admin. All rights reserved.
//

import UIKit

class CompareViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //先從葉子開始
        let nodeA1: Node = Node.init(left: nil, right: nil, value: 2)
        let nodeA2: Node = Node.init(left: nil, right: nil, value: 3)
        let nodeA3: Node = Node.init(left: nodeA1, right: nodeA2, value: 5)
        let treeA: Tree = Tree.init(root: nodeA3)
        
        let nodeB1: Node = Node.init(left: nil, right: nil, value: 3)
        let nodeB2: Node = Node.init(left: nodeB1, right: nil, value: 2)
        let nodeB3: Node = Node.init(left: nil, right: nodeB2, value: 1)
        let treeB: Tree = Tree.init(root: nodeB3)
        
        let answer3: Int = compareBinaryTree(treeA: treeA, treeB: treeB)
        print(answer3)
    }
    
    func compareBinaryTree(treeA: Tree, treeB: Tree) -> Int
    {
        //本來想輸出兩個陣列, 再去用陣列比較
        //但比較時要連nil也要比較, 所以用陣列的話要先求出層數
        //才知道要以哪個層數較高的為主去畫perfect binary tree
        let aryA = treeA.levelorder()
        let aryB = treeB.levelorder()
        return -1
    }
}
