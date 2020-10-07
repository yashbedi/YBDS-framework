//
//  QuickSort.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 28/09/20.
//

import Foundation


struct Quick<T: Comparable> {
    
    static func sort(arr: inout [T], start: Int, end: Int){
        if start >= end { return }
        let pidx = partition(arr: &arr, start: start, end: end)
        sort(arr: &arr, start: start, end: pidx-1)
        sort(arr: &arr, start: pidx+1, end: end)
    }
    
    private static func partition(arr: inout [T], start: Int, end: Int) -> Int{
        let pivot = arr[end]
        var pidx = start
        
        for i in start..<end{
            if arr[i] <= pivot{
                arr.swapAt(i, pidx)
                pidx += 1
            }
        }
        arr.swapAt(pidx, end)
        return pidx
    }
}
