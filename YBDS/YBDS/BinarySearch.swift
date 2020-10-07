//
//  BinarySearch.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 23/05/20.
//

import Foundation

#warning("ABORT--NOT WORKING.. FIXes TO BE APPLIEd.. aka WIP")

// MARK: Time complexity -> Best case : O(1); Worst/Average case : O(LogN);
@available(*,deprecated)
public final class BinarySearch<T: Comparable>{
    class func find(_ key: T, where start: Int, and end: Int, from arr: [T]) -> Bool {
        if start > end {
            print("Elem Not Found.")
            return false
        }
        let mid = (start + (end - start))/2 // (end + start may overflow, therefore coz sometimes end + start can exceed a value, where an integer can store a value, for eg, a signed 32 bit integer can store can store a value of 2 to the power 31 and if both end and start are pretty big then end + start will exceed 2 to the power 31 obviously cause issues)
        if arr[mid] == key {
            print("Found Elem: \(arr[mid]) at \(mid)")
            return true
        }else if  arr[mid] < key {
            // Right side of the array
            return BinarySearch.find(key, where: mid + 1, and: end, from: arr)
        }else{
            // Left side of the array
            return BinarySearch.find(key, where: start, and: mid - 1, from: arr)
        }
    }
}
