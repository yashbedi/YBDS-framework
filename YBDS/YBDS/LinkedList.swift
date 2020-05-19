//
//  LinkedList.swift
//  YBDS
//
//  Created by Yash Bedi on 19/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation
// Vanila verion of Generic LinkedList without using inbuild api's

// MARK: LinkedList Data Structure


final class Node<T>{
    var data: T
    var next: Node?
    
    init(data: T, next: Node?){
        self.data = data
        self.next = next
    }
}

public final class LinkedList<T> {
    
    private var head: Node<T>?
    
    func printList(){
        if isEmpty() {
            print("Empty List..")
            print("-------------------------------")
            return
        }
        if listHasOnlyOneNode() {
            print("Data: ",head?.data)
            print("-------------------------------")
            return
        }
        var temp : Node<T> = head!
        while temp.next != nil {
            print("Data: ",temp.data)
            temp = (temp.next)!
        }
        print("Data: ",temp.data)
        print("-------------------------------")
    }
    
    func firstElem() -> T?{
        return isEmpty() ? nil : head?.data
    }
}

// MARK: Insertion & Deletion At Position

extension LinkedList {
    func insert(at position: Int, with data: T){
        if isEmpty() {
            print("List is empty by default insertion will happen at position 0")
            insertAtBeginning(data)
            return
        }
        if listHasOnlyOneNode() {
            print("List has only 1 element")
            if position == 0 {
                insertAtBeginning(data)
                return
            }else{
                insertAtEndWith(data: data)
                return
            }
        }
        if position >= numberOfNodes() {
            insertAtEndWith(data: data)
            return
        }
        if position < 0 || position - 1 == 0{
            insertAtBeginning(data)
            return
        }
        let node = createNode(with: data)
        var temp: Node<T> = head!
        var prev: Node<T>? = nil
        
        for _ in 0..<position - 1{
            prev = temp
            temp = (temp.next)!
        }
        node.next = temp
        prev?.next = node
    }
    
    func delete(at position:Int){
        if isEmpty() {
            print("List is empty...")
            return
        }
        if listHasOnlyOneNode() || position - 1 == 0{
            deleteAtBeggining()
            return
        }
        if position > numberOfNodes() || position < 0{
            print("The position doesn't exists..")
            return
        }
        var temp: Node<T>? = head!
        var prev: Node<T>? = nil
        for _ in 0..<position - 1{
            prev = temp
            temp = (temp?.next)!
        }
        prev?.next = temp?.next
        print("Deleted node is: ",temp?.data)
        temp = nil
    }
}


// MARK: Insertion & Deletion At Beginning

extension LinkedList {
    func insertAtBeginning(_ data: T){
        if isEmpty() {
            insertAtEndWith(data: data)
            return
        }
        let node = createNode(with: data)
        node.next = head
        head = node
    }
    func deleteAtBeggining(){
        if isEmpty() || listHasOnlyOneNode(){
            deleteAtEnd()
            return
        }
        var temp: Node<T>? = head!
        head = temp?.next
        print("Deleted node with data: ",temp?.data)
        temp = nil
    }
}


// MARK: Insertion & Deletion At End
extension LinkedList {
    func insertAtEndWith(data: T){
        let node = createNode(with: data)
        if isEmpty() {
            head = node
            return
        }
        if listHasOnlyOneNode() {
            head?.next = node
            return
        }
        var temp : Node<T> = head!
        while temp.next != nil {
            temp = (temp.next)!
        }
        temp.next = node
    }
    func deleteAtEnd() {
        if isEmpty() {
            fatalError("Empty List")
        }
        if listHasOnlyOneNode() {
            print("Deleted Node: ",head?.data)
            head = nil
            return
        }
        var temp: Node<T>? = head!
        var prev: Node<T>? = nil
        while temp?.next != nil {
            prev = temp
            temp = (temp?.next)!
        }
        print("Deleted Node: ",temp?.data)
        prev?.next = nil
        temp = nil
    }
    
    func isEmpty() -> Bool{
        return head == nil
    }
}

// MARK: Utility methods for LinkedList

private extension LinkedList {
    func createNode(with data: T) -> Node<T>{
        return Node(data: data, next: nil)
    }
    func listHasOnlyOneNode() -> Bool {
        return head?.next == nil
    }
    func numberOfNodes() -> Int {
        if !isEmpty() {
            var temp : Node<T> = head!
            var count: Int = 1
            while temp.next != nil {
                temp = (temp.next)!
                count += 1
            }
            return count
        }
        return 0
    }
}
