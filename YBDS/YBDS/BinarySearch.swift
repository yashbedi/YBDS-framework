//
//  BinarySearch.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 23/05/20.
//

import Foundation

// MARK: Time complexity -> Best case : O(1); Worst/Average case : O(LogN);
public final class BinarySearch<T: Comparable>{
    class func find(_ key: T, where start: Int, and end: Int, from arr: [T]) {
        if start > end {
            print("Elem Not Found.")
            return
        }
        let mid = (end + start)/2
        if arr[mid] == key {
            print("Found Elem: \(arr[mid]) at \(mid)")
            return
        }else if key > arr[mid] {
            BinarySearch.find(key, where: mid + 1, and: end, from: arr)
        }else if key < arr[mid] {
            BinarySearch.find(key, where: start, and: mid - 1, from: arr)
        }
    }
}
