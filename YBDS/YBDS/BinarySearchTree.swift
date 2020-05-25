//
//  BinarySearchTree.swift
//  YBDS
//
//  Created by Yash Bedi on 19/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation

// Vanila verion of Generic BSTree without using inbuild api's
// MARK: BSTree Data Structure

public final class TreeNode<T: Comparable> {
    var data: T?
    var leftNode: TreeNode<T>?
    var rightNode: TreeNode<T>?
    init() { }
    init(data: T?, left: TreeNode<T>? ,right: TreeNode<T>?) {
        self.data = data
        self.leftNode = left
        self.rightNode = right
    }
}

final class BSTree<T: Comparable>: BinaryTree<T> { }

// MARK: Utility functions

extension BSTree {
    private func createNode(with data: T) -> TreeNode<T>{
        return TreeNode(data: data, left: nil, right: nil)
    }
    private func treeIsEmpty() -> Bool{
        return rootNode == nil
    }
    private func treeHasOneNode() -> Bool{
        return rootNode?.leftNode == nil && rootNode?.rightNode == nil ? true : false
    }
    private func nodeHasChildren(node: TreeNode<T>) -> Bool{
        return node.leftNode == nil && node.rightNode == nil ? true : false
    }
}


// MARK: Using Iteration.
// MARK: Insertion in BST
// MARK: Searching in BST
// MARK: Finding Min & Max in a BST
extension BSTree {
    
    func iterativeInsertion(with data: T) {
        if treeIsEmpty() {
            rootNode = createNode(with: data)
            return
        }
        var tempNode: TreeNode<T>? = rootNode
        while (tempNode?.data != nil) {
            if (tempNode?.data)! > data {
                if tempNode?.leftNode == nil {
                    tempNode?.leftNode = createNode(with: data)
                    return
                }
                tempNode = tempNode?.leftNode
            }else {
                if tempNode?.rightNode == nil {
                    tempNode?.rightNode = createNode(with: data)
                    return
                }
                tempNode = tempNode?.rightNode
            }
        }
    }
    func iterativeSearch(data: T) -> Bool {
        if treeIsEmpty() {
            return false
        }else if treeHasOneNode() && rootNode?.data == data {
            return true
        }else {
            var tempNode: TreeNode<T>? = rootNode
            while tempNode?.data != nil {
                if tempNode?.data == data {
                    return true
                }else if (tempNode?.data)! > data {
                    // search left side of the tree
                    tempNode = tempNode?.leftNode
                }else{
                    // search right side of the tree
                    tempNode = tempNode?.rightNode
                }
            }
            return false
        }
    }
    func iterativFindMinInBST() -> T {
        if treeIsEmpty() { fatalError("Tree empty") }
        var tempNode: TreeNode<T> = rootNode!
        while tempNode.leftNode != nil {
            tempNode = tempNode.leftNode!
        }
        return (tempNode.data)!
    }
    func iterativFindMaxInBST() -> T {
        if treeIsEmpty() { fatalError("Tree empty") }
        var tempNode: TreeNode<T> = rootNode!
        while tempNode.rightNode != nil {
            tempNode = tempNode.rightNode!
        }
        return (tempNode.data)!
    }
}


// MARK: Using Recursion.
// MARK: We dont use the rootnode created as a class variable in this class, while using recursion.
// MARK: Insertion in BST
// MARK: Searching in BST
// MARK: Finding Min & Max in a BST
extension BSTree {
    
    func recursiveInsertion(node: inout TreeNode<T>?, data: T)-> TreeNode<T> {
        if node == nil{
            node = createNode(with: data)
            return node!
        }else if (node?.data)! > data {
            node?.leftNode = recursiveInsertion(node: &node!.leftNode, data: data)
        }else{
            node?.rightNode = recursiveInsertion(node: &node!.rightNode, data: data)
        }
        return node!
    }
    
    func recursiveSearch(data: T,for node: inout TreeNode<T>?) -> Bool{
        if node == nil {
            return false
        }else if (node?.data)! == data {
            return true
        }else if (node?.data)! > data {
            return recursiveSearch(data: data, for: &node!.leftNode)
        }else{
            return recursiveSearch(data: data, for: &node!.rightNode)
        }
    }
    
    func recursiveFindMinInBST(node: inout TreeNode<T>?) -> T{
        if node == nil { fatalError("Tree empty") }
        else if node?.leftNode == nil {
            return (node?.data)!
        }
        // search in the left subTree
        return recursiveFindMinInBST(node: &node!.leftNode)
    }
    
    func recursiveFindMaxInBST(node: inout TreeNode<T>?) -> T{
        if node == nil { fatalError("Tree empty") }
        else if node?.rightNode == nil {
            return (node?.data)!
        }
        // search in the right subTree
        return recursiveFindMaxInBST(node: &node!.rightNode)
    }
    func breadthFirstSearch(rootNode: TreeNode<T>){
        levelOrderTreeTraversal(node: rootNode)
    }
    func levelOrderTreeTraversal(node: TreeNode<T>?){
        if node == nil{
            debugPrint("Empty Tree")
            return
        }
        let queue = QueueUsingLL<TreeNode<T>>()
        queue.enqueue(node!)
        while !queue.isEmpty {
            if let currentNode = queue.getPeak(){
                print("Visited node: ",currentNode.data)
                if currentNode.leftNode != nil {
                    queue.enqueue((currentNode.leftNode)!)
                }
                if currentNode.rightNode != nil {
                    queue.enqueue((currentNode.rightNode)!)
                }
                queue.dequeue()
            }
        }
    }
}
