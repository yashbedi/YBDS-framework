//
//  QueueUsingLL.swift
//  YBDS
//
//  Created by Yash Bedi on 19/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation

public final class QueueUsingLL<T> {
    private var list = LinkedList<T>()
}
public extension QueueUsingLL {
    var isEmpty : Bool {
        return list.isEmpty()
    }
    
    func enqueue(_ object: T){
        list.insertAtEndWith(data: object)
    }
    
    func dequeue(){
        list.deleteAtBeggining()
    }
    
    func getPeak() -> T? {
        return isEmpty ? nil : list.firstElem()
    }
}
