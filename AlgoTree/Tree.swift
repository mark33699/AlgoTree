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
    init(root: Node)
    {
        self.root = root
    }
    
    func strInorder() -> String
    {
        var strInorder = ""
        
//        var currentNode: Node = self.root
//
//        repeat
//        {
//            if let left = currentNode.left
//            {
//                currentNode = left
//            }
//        }
//        while (currentNode.left != nil)
        
        /*
         //逐一放入, 逐一取出, 應該是FILO
         
         1.如果有左, 往左
         2.如果沒有, 輸出自己(6), 往上
         3.自己未輸出 ? 輸出自己(3), 往右
           自己已輸出 ? 往上
         4.回到1.
         */
        
        return strInorder
    }
    
    func travelDSF()
    {
        
    }
    
    func levelorder() -> [Int?]
    {
        var aryLevelorder: [Int?] = [self.root.value]
        var aryReady = [self.root]
        
        repeat
        {
            (aryLevelorder, aryReady) = travelBSF(aryLevelorder: aryLevelorder, aryReady: aryReady)
        }
        while(aryReady.count > 0)
        
        return aryLevelorder
    }
    
    func travelBSF(aryLevelorder: [Int?], aryReady: [Node]) ->  ([Int?], [Node])
    {
        var aryLevelorder = aryLevelorder
        var aryReady = aryReady
        let currentNode: Node = aryReady.first!
        aryReady.remove(at: 0)
        
//        aryLevelorder.append(currentNode.value)
        if let left = currentNode.left
        {
            aryLevelorder.append(left.value)
            aryReady.append(left)
        }
        else
        {
            aryLevelorder.append(nil)
        }
        if let right = currentNode.right
        {
            aryLevelorder.append(right.value)
            aryReady.append(right)
        }
        else
        {
            aryLevelorder.append(nil)
        }
        
        return (aryLevelorder, aryReady)
    }
}
