//
//  DoublyLL.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 06/09/20.
//

import Foundation


public final class DNode <T: Comparable>{
    var data: T
    var next: DNode?
    var prev: DNode?
    
    init(data: T, next: DNode?, prev: DNode?){
        self.data = data
        self.next = next
        self.prev = prev
    }
}

public final class DoublyLL<T: Comparable> {
    
    private var head: DNode<T>?
    
}

// MARK: Insertion in DoublyLL

extension DoublyLL {
    
    ///Insertion in DoublyLL @ End
    func insertAtEnd(with data: T) {
        if headNil(data) { return }
        
        let newNode = createNode(with: data)
        let lastNode = traverseDLLToLast()
        
        lastNode?.next = newNode
        newNode.prev = lastNode
    }
    
    ///Insertion in DoublyLL @ Beginning
    func insertAtBeg(with data: T){
        if headNil(data){ return }
        
        let newNode = createNode(with: data)
        newNode.next = head
        head?.prev = newNode
        head = newNode
    }
    
    ///Insertion in DoublyLL @ Position
    func insertAt(pos: Int, with data: T){
        if headNil(data) { return }
        
        if pos > totalNodes(){
            insertAtEnd(with: data)
            return
        }
        
        if pos < 1 {
            insertAtBeg(with: data)
            return
        }
        
        var count = 1
        var temp : DNode<T>? = head
        var prev : DNode<T>? = nil
        
        while count < pos {
            count += 1
            prev = temp
            temp = temp?.next
        }
        let newNode = createNode(with: data)
        
        newNode.next = temp
        newNode.prev = prev
        
        temp?.prev = newNode
        prev?.next = newNode
    }
}

// MARK: Deletion in DoublyLL

extension DoublyLL {
    
    ///Deletion in DoublyLL @ Beginning
    func deleteAtBeg(){
        if head == nil || head?.next == nil {
            deleteAtEnd()
            return
        }
    
        var temp: DNode<T>? = head
        head = temp?.next
        debugPrint(" Deleted node is: \(temp?.data as Any)")
        temp = nil
    }
    
    ///Deletion in DoublyLL @ End
    func deleteAtEnd(){
        if head == nil { debugPrint(" DLL is empty "); return }
        
        if head?.next == nil { head = nil; return}
        
        var temp: DNode<T>? = head
        var prev: DNode<T>? = nil
        while temp?.next != nil {
            prev = temp
            temp = temp?.next
        }
        prev?.next = nil
        debugPrint(" Deleted node is: \(temp?.data as Any)")
        temp = nil
    }
    
    ///Deletion in DoublyLL @ Position
    func deleteAt(pos: Int){
        if head == nil { debugPrint(" DLL is empty "); return }
        
        if pos > totalNodes() || pos < 1{
            debugPrint(" Position doesn't exist ")
            return
        }
        
        if head?.next == nil { head = nil; return}
        
        var count = 1
        var temp : DNode<T>? = head
        var prev : DNode<T>? = nil
        
        while count < pos {
            count += 1
            prev = temp
            temp = temp?.next
        }
        prev?.next = temp?.next
        temp?.next?.prev = prev
        debugPrint(" Deleted node is: \(temp?.data as Any)")
        temp = nil
    }
}

// MARK: Traversal of DoublyLL
extension DoublyLL {
    
    func totalNodes() -> Int{
        var count = 1
        var temp : DNode<T>? = head
        if head == nil { debugPrint("DLL is empty") ; return 0 }
        while temp?.next != nil {
            count += 1
            temp = temp?.next
        }
        return count
    }
}



private extension DoublyLL {
    
    private func headNil(_ data: T) -> Bool{
        if head == nil{
            head = createNode(with: data)
            return true
        }
        return false
    }
    private func createNode(with data: T) -> DNode<T>{
        return DNode<T>(data: data,
                        next: nil,
                        prev: nil)
    }
}


// MARK: Extensions for Dequeue
extension DoublyLL {
    func isEmpty()->Bool{
        return head == nil
    }
    
    func getHead()-> T?{
        return head?.data
    }
    
    @discardableResult
    func traverseDLLToLast(_ isDebugging : Bool = false) -> DNode<T>?{
        if head == nil { debugPrint("DLL is empty") ; return nil }
        var temp : DNode<T>? = head
        isDebugging ? debugPrint(" -- ",temp?.data as Any) : ()
        while temp?.next != nil {
            temp = temp?.next
            isDebugging ? debugPrint(" -- ",temp?.data as Any) : ()
        }
        return temp
    }
}
