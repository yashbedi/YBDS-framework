//
//  Stack.swift
//  YBDS
//
//  Created by Yash Bedi on 19/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation

// Vanila verion of Generic Queue without using inbuild api's
// MARK: Stack Data Structure

public struct Stack<T> {
    private var stackArr: [T]
    var isEmpty : Bool {
        return stackArr.count == 0
    }
    var tos : T? {
        if isEmpty {
            debugPrint("Stack is Empty")
            return nil
        }else{
            return stackArr.last
        }
    }
    init() { stackArr = [] }
    mutating func push(_ data: T){ stackArr.append(data) }
    mutating func pop() {
        if isEmpty {
            debugPrint("Stack is Empty")
            return
        }
        stackArr.removeLast()
    }
}
