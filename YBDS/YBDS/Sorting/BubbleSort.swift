//
//  BubbleSort.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 26/09/20.
//

import Foundation

// MARK: Time Complexity: O(n*n)

struct Bubble<T:Comparable> {
    
    static func sort(arr: inout [T], size: Int)-> [T]{
        for _ in 0..<size {
            for j in 0..<size-1{
                if arr[j] > arr[j+1]{
                    var x = arr[j]
                    var y = arr[j+1]
                    Bubble._swap(x: &x, y: &y)
                    arr[j] = x
                    arr[j+1] = y
                }
            }
        }
        return arr
    }
    
    private static func _swap(x: inout T, y: inout T){
        let temp = x;
        x = y;
        y = temp;
    }
}
