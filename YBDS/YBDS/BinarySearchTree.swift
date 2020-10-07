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
                print("Visited node: ",currentNode.data!)
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

extension BSTree {
    
    
    func delete(node: inout TreeNode<T>?, with data: T) -> TreeNode<T>?{
        
        if node == nil { return node }
            
        else if node!.data! < data {
            // right subtree
            return delete(node: &(node!.rightNode), with: data)
        }
        else if node!.data! > data {
            // left subtree
            return delete(node: &node!.leftNode, with: data)
        }else{
            // case 0: with zero left and right child
            // case 1: with 1 left or right child
            // case 2: with both left and right child
            
                //case 0:
            if node?.leftNode == nil && node?.rightNode == nil {
                node = nil
                return node
            }   // case 1:
            else if node?.leftNode == nil {
                var tempNode: TreeNode<T>? = createNode(with: node!.data!) // MARK: **
                node = node?.rightNode
                tempNode = nil // MARK: **
                return node
            }   // case 1:
            else if node?.rightNode == nil {
                var tempNode: TreeNode<T>? = createNode(with: node!.data!) // MARK: **
                node = node?.leftNode
                tempNode = nil // MARK: **
                return node
                
                /// The above code works by deleting the lines which are Marked by `**`. It looks like theres a memory leak but I haven't debbugged it.
                // TODO: Debugging post deleting those lines
            }
                
                // case 2:
            else{
                // either traverse and find max in left subtree or find min in right subtree
                var tempNode: TreeNode<T>? = recursiveMinInBST(node: &node!.rightNode)
                node?.data = tempNode?.data
                node?.rightNode = delete(node: &node!.rightNode, with: tempNode!.data!)
                return node
            }
        }
    }
    
    
    func recursiveMinInBST(node: inout TreeNode<T>?) -> TreeNode<T>?{
        if node == nil { return nil }
            
        else if node?.leftNode == nil { return node }
        
        // search in the left subTree
        return recursiveMinInBST(node: &node!.leftNode)
    }
}



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
