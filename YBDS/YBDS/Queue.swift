//
//  Queue.swift
//  YBDS
//
//  Created by Yash Bedi on 19/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation

// Vanila verion of Generic Queue without using inbuild api's
// MARK: Queue Data Structure

struct Queue<T> {
    private var front: Int = -1
    private var rear: Int = -1
    private var queueArr: [T]
    init(){ queueArr = [] }
    mutating func enqueue(data: T){
        if isQueueEmpty() {
            front = 0
            rear = 0
            queueArr.insert(data, at: rear)
            
            //queueArr[rear] = data
// MARK: Gives you index out of bounds error. looking at LHS : means we're accesssing rear'th element from queueArr then overwriting it with data. And since nothing exists on that location we get index_out_bounds exception.
        
            return
        }
        rear += 1
        queueArr.insert(data, at: rear)
    }
    mutating func dequeue(){
        if isQueueEmpty() {
            fatalError("Queue is Empty...")
        }
        if front == rear {
            front = -1
            rear = -1
            queueArr.removeAll()
            return
        }
        front += 1
    }
    func element() -> T {
        if isQueueEmpty() {
            fatalError("Queue is Empty...")
        }
        return queueArr[front]
    }
}
extension Queue {
    private func isQueueEmpty() -> Bool{
        return front | rear == -1
    }
}
