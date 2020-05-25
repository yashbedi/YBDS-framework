//
//  StackUsingLL.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 25/05/20.
//

import Foundation

public final class StackUsingLL<T:Comparable> {
    private let list: LinkedList<T> = LinkedList<T>()
    init() { }
}
public extension StackUsingLL {
    var isEmpty: Bool {
        return list.isEmpty()
    }
    func push(_ object: T) {
        list.insertAtBeginning(object)
    }
    func pop() {
        if list.isEmpty() {
            debugPrint("Stack is empty")
            return
        }
        list.deleteAtBeggining()
    }
    func tos() -> T? {
        return list.firstElem()
    }
}
