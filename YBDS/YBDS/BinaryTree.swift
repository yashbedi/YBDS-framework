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
    var outerArr = [[T]]()
}

extension BinaryTree {
    // MARK: Traversals
    
    // LDR
    func inOrder(node: TreeNode<T>?) {
        if node == nil { return }
        inOrder(node: node?.leftNode)
        print(node?.data as Any)
        inOrder(node: node?.rightNode)
    }
    // DLR
    func preOrder(node: TreeNode<T>?) {
        if node == nil { return }
        print(node?.data as Any)
        preOrder(node: node?.leftNode)
        preOrder(node: node?.rightNode)
    }
    // LRD
    func postOrder(node: TreeNode<T>?) {
        if node == nil { return }
        postOrder(node: node?.leftNode)
        postOrder(node: node?.rightNode)
        print(node?.data as Any)
    }
}

public extension BinaryTree {
    func findHeightOfTree(_ node: TreeNode<T>?) -> Int{
        if node == nil { return -1 }
        let leftHeight = findHeightOfTree(node?.leftNode)
        let rightHeight = findHeightOfTree(node?.rightNode)
        return max(leftHeight, rightHeight) + 1
    }
    
    /// MARK: Wip.
    @available(*, deprecated)
    func isValidBST(_ node: TreeNode<T>?) -> Bool{
        if node == nil { return true }
        isValidBST(node?.leftNode)
        print(node?.data as Any)
        isValidBST(node?.rightNode)

        return true
    }
    
    func verifyBST(node: TreeNode<T>?, lastValue: inout T?) -> Bool {
        if node == nil {
            return true
        }

        // since we're doing in-order traversal,
        //  the lastValue from previous traversal path must be <= current value
        if let prevVal = lastValue, prevVal > (node!.data)!{
            return false
        }

        // visit left
        if !verifyBST(node: node!.leftNode, lastValue: &lastValue) {
            return false
        }

        // comapre and visit self node aka current node
        if let leftValue = lastValue, leftValue > (node!.data)! {
            return false
        }
        lastValue = node!.data

        // visit right
        if !verifyBST(node: node!.rightNode, lastValue: &lastValue) {
            return false
        }

        return true
    }
      
}

extension BinaryTree {
    func findAllPaths(node: TreeNode<T>?, innerArr: inout [T]){
        if node == nil { return }
        innerArr.append(node!.data!)
        if node?.leftNode == nil && node?.rightNode == nil {
            outerArr.append(innerArr)
        }else{
            findAllPaths(node: node?.leftNode, innerArr: &innerArr)
            findAllPaths(node: node?.rightNode, innerArr: &innerArr)
        }
        innerArr.removeLast()
    }
}
