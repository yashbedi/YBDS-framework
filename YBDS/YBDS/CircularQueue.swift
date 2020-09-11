//
//  CircularQueue.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 11/09/20.
//

import Foundation


// Vanila verion of Generic Queue without using inbuild api's
// MARK: CircularQueue Data Structure

/// Since this is a Circular Queue and movement of `rear` and `front` in the enqueuing part and dequeuing part will take place via expression modulo N
/// N: Total number of elements
/// Current location is `i`
/// Enqueue -> `(i + 1 % N)`
/// Dequeue -> `(i - 1 % N)`

// MARK: CircularQueue AKA Ring Buffer AKA Circular Buffer

struct CircularQueue<T>{
    private var next: Int = -1
    private var prev: Int = -1
    private var queueArr: ContiguousArray<T?>
    init(_ size : Int){
        queueArr = ContiguousArray<T?>(repeating: nil, count: size)
    }
    //convenience init
    init(){
        self.init(5)
    }
    mutating func enqueue(_ element : T){
        if isQFull(){
            debugPrint("Queue if full -> Try Dequing first")
            return
        }
        if isQEmpty() {
            next = 0
            prev = 0
        }else{
            next = (next + 1) % queueArr.count
        }
        queueArr[next] = element
    }
    mutating func dequeue(){
        if isQEmpty() {
            debugPrint("Queue if Empty")
            return
        }
        if prev == next {
            queueArr[prev] = nil
            debugPrint("Queue fully Emptied")
            return
        }
        queueArr[prev] = nil
        prev = (prev + 1) % queueArr.count
    }
    
    @discardableResult
    mutating func peek() -> T?{
        if isQEmpty() {
            debugPrint("Queue if Empty")
            return nil
        }
        return queueArr[next]
    }
}

private extension CircularQueue {
    mutating func isQEmpty() -> Bool {
        return next | prev == -1
    }
    mutating func isQFull() -> Bool {
        return (next + 1) % queueArr.count == prev
    }
}
