//
//  InorderViewController.swift
//  AlgoTree
//
//  Created by Admin on 2019/3/8.
//  Copyright © 2019年 Admin. All rights reserved.
//

import UIKit

class InorderViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let node6: Node = Node.init(left: nil, right: nil, value: 6)
        let node7: Node = Node.init(left: nil, right: nil, value: 7)
        let node3: Node = Node.init(left: node6, right: node7, value: 3)
        let node4: Node = Node.init(left: nil, right: nil, value: 4)
        let node1: Node = Node.init(left: node3, right: node4, value: 1)
        let node8: Node = Node.init(left: nil, right: nil, value: 8)
        let node9: Node = Node.init(left: nil, right: nil, value: 9)
        let node5: Node = Node.init(left: node8, right: node9, value: 5)
        let node2: Node = Node.init(left: nil, right: node5, value: 2)
        let node0: Node = Node.init(left: node1, right: node2, value: 0)
        let tree: Tree = Tree.init(root: node0)
        print(tree.strInorder())
    }
}
