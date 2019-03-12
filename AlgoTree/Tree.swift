//
//  Tree.swift
//  AlgoTree
//
//  Created by Admin on 2019/3/8.
//  Copyright © 2019年 Admin. All rights reserved.
//

import Foundation

class Tree
{
    var root: Node
    var postOrder = [Int]()
    init(root: Node)
    {
        self.root = root
    }
    
    func ntnuPostOrder(node: Node?)
    {
        guard let node = node else
        {
            return
        }
        ntnuPostOrder(node: node.left)
        ntnuPostOrder(node: node.right)
        postOrder.append(node.value)
    }
    
    func bigGodMaxDepth(root: Node?) -> Int
    {
        guard let root = root else {
            return 0
        }
        return max(bigGodMaxDepth(root: root.left), bigGodMaxDepth(root: root.right)) + 1
    }
    
    func bigGodPreOrder() -> [Int]
    {
        var res = [Int]() //答案
        var stack = [Node]() //走過的
        var node: Node? = self.root //當前
        
        while !stack.isEmpty || node != nil
        {
            if node != nil
            {
                //旅行的順序跟輸出的順序相同
                res.append(node!.value)
                stack.append(node!)
                //往左下鑽
                node = node!.left
            }
            else
            {
                //左下沒有的話, 就把取得右下, 並且往上
                node = stack.removeLast().right
            }
        }
        return res
    }
    
    func bigGodInOrder() -> [Int]
    {
        var res = [Int]()
        var stack = [Node]()
        var node: Node? = self.root
        
        while !stack.isEmpty || node != nil
        {
            if node != nil
            {
                stack.append(node!)
                node = node!.left
            }
            else
            {
                res.append(stack.last!.value)
                node = stack.removeLast().right
            }
        }
        return res
    }
    
    func bigGodPostOrder() -> [Int]
    {
        var res = [Int]()
        var stack = [Node]()
        var node: Node? = self.root
        
        while !stack.isEmpty || node != nil
        {
            if node != nil
            {
                stack.append(node!)
                node = node!.left
            }
            else
            {
                let last = stack.last!
                node = stack.removeLast().right
                if node == nil
                {
                    res.append(last.value)
                }
                else
                {
                    res.append(node!.value)
                }
            }
        }
        return res
    }
    
    func bigGodLevelOrder() -> [[Int]]
    {
        var res = [[Int]]()
        var queue = [Node]()
        
        queue.append(self.root)
        while queue.count > 0
        {
            var level = [Int]()
            for _ in 0 ..< queue.count
            {
                let node = queue.removeFirst()
                level.append(node.value)
                if let left = node.left
                {
                    queue.append(left)
                }
                if let right = node.right
                {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
    
    func strInorder() -> String
    {
        var strInorder = ""
        var currentNode: Node = self.root
        var aryReady = [currentNode]

        repeat
        {
            if let left = currentNode.left
            {
                currentNode.hasBeenLeft = true
                currentNode = left
            }
            aryReady.append(currentNode)
        }
        while (currentNode.left != nil)
        currentNode.hasBeenLeft = true
        strInorder = strInorder + "\(currentNode.value)"
        currentNode.isPick = true
        aryReady.removeLast()
        
        repeat
        {
            currentNode = aryReady.last!
            if currentNode.isPick == false
            {
                strInorder = strInorder + "\(currentNode.value)"
                currentNode.isPick = true
                if let right = currentNode.right
                {
                    currentNode.hasBeenRight = true
                    currentNode = right
                }
                aryReady.append(currentNode)
            }
            else
            {
                //往上
                aryReady.removeLast()
                currentNode = aryReady.last!
            }
            
            repeat
            {
                if currentNode.hasBeenLeft == false
                {
                    if let left = currentNode.left
                    {
                        currentNode.hasBeenLeft = true
                        currentNode = left
                        aryReady.append(currentNode)
                    }
                }
                else if currentNode.hasBeenRight == false
                {
                    strInorder = strInorder + "\(currentNode.value)"
                    currentNode.isPick = true
                    if let right = currentNode.right
                    {
                        currentNode.hasBeenRight = true
                        currentNode = right
                    }
                    aryReady.append(currentNode)
                }
            }
            while (currentNode.left != nil)
            currentNode.hasBeenLeft = true
            strInorder = strInorder + "\(currentNode.value)"
            currentNode.isPick = true
            aryReady.removeLast()//沒加下面這段會加不了5, 但加了會有其他問題
//            if currentNode.hasBeenRight == false
//            {
//                if let right = currentNode.right
//                {
//                    currentNode.hasBeenRight = true
//                    currentNode = right
//                }
//                aryReady.append(currentNode)
//            }
//            else
//            {
//                aryReady.removeLast()
//            }
        }
        while (aryReady.count > 0)

        return strInorder
    }
    
    func levelorder() -> [Int?]
    {
        var aryLevelorder: [Int?] = [self.root.value]
        var aryReady: [Node?] = [self.root] //我想讓陣列裡可含nil, 但寫[Node?]會讓裡面的元素型別變成 Node??
        
        repeat
        {
            (aryLevelorder, aryReady) = travelBSF(aryLevelorder: aryLevelorder, aryReady: aryReady)
        }
        while(aryReady.count > 0)
        
        return aryLevelorder
    }
    
    func travelBSF(aryLevelorder: [Int?], aryReady: [Node?]) ->  ([Int?], [Node?])
    {
        var aryLevelorder = aryLevelorder
        var aryReady = aryReady
        let currentNode = aryReady.first
        aryReady.remove(at: 0)
        
        if let currentNode = currentNode
        {
            if let left = currentNode?.left
            {
                aryLevelorder.append(left.value)
                aryReady.append(left)
            }
            else
            {
                aryLevelorder.append(nil)
                aryReady.append(nil)
            }
            if let right = currentNode?.right
            {
                aryLevelorder.append(right.value)
                aryReady.append(right)
            }
            else
            {
                aryLevelorder.append(nil)
                aryReady.append(nil)
            }
        }
        else
        {
            aryLevelorder.append(nil)
            aryLevelorder.append(nil)
        }
        
        return (aryLevelorder, aryReady)
    }
}
