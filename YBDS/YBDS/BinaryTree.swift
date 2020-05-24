//
//  BinaryTree.swift
//  YBDS
//
//  Created by Yash Bedi on 24/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation
// Vanila verion of Generic BinaryTree without using inbuild api's
// MARK: BinaryTree Data Structure

public final class BinaryTree<T: Comparable> {
    var rootNode: TreeNode<T>? = nil
    init() { }
    func createNode(data: T) -> TreeNode<T>{
        return TreeNode<T>(data: data, left: nil, right: nil)
    }
}

extension BinaryTree {
    // MARK: Traversals
    
    // LDR
    func inOrder(node: TreeNode<T>?) {
        if node == nil { return }
        preOrder(node: node?.leftNode)
        print(node?.data)
        preOrder(node: node?.rightNode)
    }
    // DLR
    func preOrder(node: TreeNode<T>?) {
        if node == nil { return }
        print(node?.data)
        preOrder(node: node?.leftNode)
        preOrder(node: node?.rightNode)
    }
    // LRD
    func postOrder(node: TreeNode<T>?) {
        preOrder(node: node?.leftNode)
        preOrder(node: node?.rightNode)
        print(node?.data)
    }
}
