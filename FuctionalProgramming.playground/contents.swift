// Playground - noun: a place where people can play

import UIKit

/// Filter
var evens = [Int]()
evens = Array(1...10).filter {
    $0 % 2 == 0
}

func myFilter<T>(sources: [T], predicate: (T) -> Bool ) -> [T] {
    var res = [T]()
    for i in sources {
        if predicate(i) {
            res.append(i)
        }
    }
    return res
}

myFilter(Array(1...10)) {
    $0 % 2 == 0
}


/// Reducing

var evenSum = Array(1...10)
    .filter { $0 % 2 == 0}
    .reduce(0, combine: { (total, number) in total + number })

let digits_1 = ["3", "1", "4", "1"]
    .map { $0.toInt()! }
    .reduce(0) { (total, number) in total * 10 + number}

let digits_2 = ["3", "1", "4", "1"]
    .reduce("") { $0 + $1 }
    .toInt()!

func myReduce<T, U>(sources: [T], seed: U, combiner: (U, T) -> U) -> U {
    var res = seed
    for i in  sources{
        res = combiner(res, i)
    }
    return res
}

let myReduce_num = myReduce(["3", "1", "4", "1"], "", { $0 + $1 }).toInt()!


/// Map

//typealias Entry = (Character, [String])
//func buildIndex(words: [String]) -> [Entry] {
//    let letters = Set(words.map {
//        (word) -> Character in
//        Character(word.substringToindex(advance(words.startIndex, 1)).uppercaseString)
//    })
//    
//    return letters.map {
//        (letter) -> Entry in
//        return (letter, [])
//    }
//}


/*******************************/
let data = "5,7;3,4;55,6"

println(data.componentsSeparatedByString(";"))

func createSplitter_v1(separator: String) -> (String -> [String]) {
    func split(source: String) -> [String] {
        return source.componentsSeparatedByString(separator)
    }
    return split
}

func createSplitter_v2(separator: String)(source: String) -> [String] {
    return source.componentsSeparatedByString(separator)
}












