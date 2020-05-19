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
    
    func enque(_ object: T){
        list.insertAtEndWith(data: object)
    }
    
    func deque(){
        list.deleteAtBeggining()
    }
    
    func getPeak() -> T? {
        return isEmpty ? nil : list.firstElem()
    }
}
