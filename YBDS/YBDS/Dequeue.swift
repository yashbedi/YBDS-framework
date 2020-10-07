//
//  Dequeue.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 13/09/20.
//

import Foundation

/// Dequeue implementation using DoubyLL. 

struct Dequeue<T: Comparable> {
    
    private let doublyLL: DoublyLL<T>
    
    init() {
        doublyLL = DoublyLL<T>()
    }
    
    /// time complexity -> O(1)
    func dequeue(){
        if isEmpty(){
            debugPrint("Dequeue is empty")
            return
        }
        doublyLL.deleteAtBeg()
    }
    
    /// time complexity -> O(N)
    func dequeueAtBack(){
        if isEmpty(){
            debugPrint("Dequeue is empty")
            return
        }
        doublyLL.deleteAtEnd()
    }
    
    /// time complexity -> O(N)
    func enqueue(_ element: T){
        doublyLL.insertAtEnd(with: element)
    }
    
    /// time complexity -> O(1)
    func enqueueAtFront(_ element: T){
        doublyLL.insertAtBeg(with: element)
    }
    
    /// time complexity O(1)
    func getPeekFromFront()-> T?{
        return doublyLL.getHead()
    }
    
    /// time complexity O(N)
    func getPeekFromBack()-> T?{
        return doublyLL.traverseDLLToLast()?.data
    }
}

private extension Dequeue {
    func isEmpty()->Bool{
        return doublyLL.isEmpty()
    }
}
