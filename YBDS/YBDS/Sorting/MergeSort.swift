//
//  MergeSort.swift
//  YBDataStructures
//
//  Created by Yash Bedi on 27/09/20.
//

import Foundation


// MARK: Time Complexity: O(nlogn) avg and worst
// MARK: Space Complexity : O(n)
// MARK: NOT an in place sorting algorithm

struct Merge<T:Comparable> {
    
    static func sort(arr: [T]) -> [T]{
        
        let n = arr.count
        
        /// 1. write base condition. if arr has only one element return that.
        
        if n < 2 { return arr }
        
        /// 2.  find mid
        let mid = n / 2
        
        /// 3. create left array with lower bound = 0 & upperbound = mid - 1
        /// 3.1 create right array with lower bound = mid & upperbound = arr.count
        /// 4. Plus recursively call `func mergeSort(arr: left/right arr)` to get sorted L & R arrays
        
        let leftArr = sort(arr: Array(arr[0..<mid]))
        let rightArr = sort(arr: Array(arr[mid..<n]))
        
        return merge(Larr: leftArr, Rarr: rightArr)
    }
    
    private static func merge(Larr: [T], Rarr: [T]) -> [T]{
        
        /// 1. create
        /// `i` : idx for left arr
        /// `j` : idx for right arr
        
        var i = 0
        var j = 0
        
        /// 2. create array which is to be returned
        
        var arr = [T]()
        
        /// 3. check if `i` or `j` is less than `Larr.count | Rarr.count`. Then only continue to add elements to `arr`.
        /// if any of them(i,j) is greater than there resp arr count values, then break
        
        while (i < Larr.count && j < Rarr.count){
            
            if Larr[i] < Rarr[j]{
                arr.append(Larr[i])
                i += 1
            }else{
                arr.append(Rarr[j])
                j += 1
            }
        }
        
        ///4. check if any extra element is left in any of the array and append them to main `arr`. PS coz they are already sorted
        
        while i < Larr.count {
            arr.append(Larr[i])
            i += 1
        }
        
        while j < Rarr.count {
            arr.append(Rarr[j])
            j += 1
        }
        
        /// return final `arr`
        return arr
    }
}
