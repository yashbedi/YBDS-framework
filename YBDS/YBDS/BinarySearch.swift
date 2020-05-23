//
//  BinarySearch.swift
//  YBDS
//
//  Created by Yash Bedi on 23/05/20.
//  Copyright © 2020 Yash Bedi. All rights reserved.
//

import Foundation

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

