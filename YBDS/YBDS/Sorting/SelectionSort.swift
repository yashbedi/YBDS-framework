//
//  SelectionSort.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 26/09/20.
//

import Foundation

// MARK: Time Complexity: O(n*n)


struct Selection<T> where T: Comparable {
    static func sort(arr: inout [T], size: Int) -> [T]{
        for i in 0..<size{
            var iMin = i
            for j in i+1..<size{
                if arr[j] < arr[iMin]{
                    iMin = j
                }
            }
            let temp = arr[i]
            arr[i] = arr[iMin]
            arr[iMin] = temp
        }
        return arr
    }
}



