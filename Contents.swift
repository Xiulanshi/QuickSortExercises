//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
1.Implement quicksort with the median pivot selection technique.
a.write median pivot selection function
b.swap with first element
c.run quicksort!


func medianPivot(arr:[Int], firstIdx: Int, lastIdx: Int) -> Int {
    
    let middle = arr[(lastIdx + 1)/2]
    
    let minOfThree = min(middle, arr[firstIdx], arr[lastIdx])
    let maxOfThree = max(middle, arr[firstIdx], arr[lastIdx])
    
    let sum = middle + arr[firstIdx] + arr[lastIdx]
    
    let median = sum - minOfThree - maxOfThree
    
    return median
}



func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    // base case
    if firstIdx >= lastIdx { return }
    // partition
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}

func quickSort(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    
    var m = medianPivot(arr, firstIdx: firstIdx, lastIdx: lastIdx)
    if m != arr[firstIdx] {
        swap(&m, &arr[firstIdx])
    }
    
    // set pivotValue to firstElement
    let pivotValue = arr[firstIdx]
    // set leftMark
    var leftMark = firstIdx + 1
    // set rightMark
    var rightMark = lastIdx
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while leftMark <= rightMark {
        while arr[leftMark] < pivotValue && leftMark <= rightMark {
            leftMark += 1
        }
        while arr[rightMark] > pivotValue && leftMark <= rightMark{
            rightMark -= 1
        }
        if leftMark < rightMark {
            swap(&arr[leftMark], &arr[rightMark])
        }
    }
    // set the correct value at the splitPoint
    if firstIdx != rightMark {
        swap(&arr[firstIdx], &arr[rightMark])
    }
    return rightMark  // return the splitPoint
}

var numbers = [22, 59, 38, 93,95, 0, 34, 58, 72, 15]

quickSort(&numbers)

*/
/*
2.How many compares (in the worst case) to partition an array of length N ?
N
*/


//3.Add in the code to run insertion sort when the length of the subarray is less than 10


func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    // base case
    if firstIdx >= lastIdx { return }
    else if lastIdx - firstIdx < 10 {
        insertionSort(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    } else
    // partition
    { let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    // quickSort on rightHalf
        quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)}
}

func quickSort(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    // set pivotValue to firstElement
    let pivotValue = arr[firstIdx]
    // set leftMark
    var leftMark = firstIdx + 1
    // set rightMark
    var rightMark = lastIdx
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while leftMark <= rightMark {
        while arr[leftMark] < pivotValue && leftMark <= rightMark {
            leftMark += 1
        }
        while arr[rightMark] > pivotValue && leftMark <= rightMark{
            rightMark -= 1
        }
        if leftMark < rightMark {
            swap(&arr[leftMark], &arr[rightMark])
        }
    }
    // set the correct value at the splitPoint
    if firstIdx != rightMark {
        swap(&arr[firstIdx], &arr[rightMark])
    }
    return rightMark  // return the splitPoint
}

var numbers = [22, 59, 38, 93,95, 0, 34, 3, 53, 6, 24, 99, 5, 636, 424, 544, 4]

quickSort(&numbers)


func insertionSort(inout arr:[Int], firstIdx: Int, lastIdx: Int) {
    var x, y, key: Int
    for (x = 0; x < lastIdx + 1; x++) {
        key = arr[x]
        for (y = x; y > -1; y--) {
            if (key < arr[y]) {
                arr.removeAtIndex(y + 1)
                arr.insert(key, atIndex: y)
            }
        }
    }
}



//func insertionSort(inout numberList:[Int]){
//    var x, y, key : Int
//    for (x = 0; x < numberList.count; x++) {
//        
//        key = numberList[x]
//        for (y = x; y > -1; y--) {
//            if (key < numberList[y]) {
//                numberList.removeAtIndex(y + 1)
//                numberList.insert(key, atIndex: y)
//            }
//        }
//    }
//}


/*
4.Write a postfix calculator
Input: [“1”, “3”,”2”, “4”, “+”, “*”, “-”]

((2+4)*3)-1

this will evaluate as (((2+4)*3)-1)

Output:  17


*/

func evaluate(tokens: [String]) -> Int {
    var stack = [String]()
    for s in tokens {
        switch s {
        case "+":
            let rightOperand = Int(stack.removeLast())
            let leftOperand = Int(stack.removeLast())
            stack.append(String(leftOperand! + rightOperand!))
            
        case "-":
            let rightOperand = Int(stack.removeLast())
            let leftOperand = Int(stack.removeLast())
            stack.append(String(rightOperand! - leftOperand!))
            
        case "*":
            let rightOperand = Int(stack.removeLast())
            let leftOperand = Int(stack.removeLast())
            stack.append(String(leftOperand! * rightOperand!))
            
        case "/":
            let rightOperand = Int(stack.removeLast())
            let leftOperand = Int(stack.removeLast())
            stack.append(String(leftOperand! / rightOperand!))
        default:
            stack.append(s)
        }
    }
    return Int(stack.removeLast())!
}

var arr = ["1", "3", "2", "4", "+", "*", "-"]

evaluate(arr)



