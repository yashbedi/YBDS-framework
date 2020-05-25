//
//  BinaryTree.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 22/05/20.
//

import Foundation

// Vanila verion of Generic BinaryTree without using inbuild api's
// MARK: BinaryTree Data Structure

public class BinaryTree<T: Comparable> {
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

public extension BinaryTree {
    func findHeightOfTree(_ node: TreeNode<T>?) -> Int{
        if node == nil { return -1 }
        let leftHeight = findHeightOfTree(node?.leftNode)
        let rightHeight = findHeightOfTree(node?.rightNode)
        return max(leftHeight, rightHeight) + 1
    }
}
