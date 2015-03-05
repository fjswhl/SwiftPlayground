// Playground - noun: a place where people can play

import Foundation


struct SortedCollection<T: Comparable> {
    private var contents: [T] = []
    
    init<S: SequenceType where S.Generator.Element == T>(_ sequence: S) {
        contents = sorted(sequence)
    }

    func indexOf(value: T) -> Int? {
        let index = _insertionIndex(contents, forValue: value)
        if index >= contents.count {
            return nil
        }
        return contents[index] == value ? index : nil
    }
    
    mutating func insert(value: T) {
        contents.insert(value, atIndex: _insertionIndex(contents, forValue: value))
    }
    
    mutating func remove(value: T) -> T? {
        if let index = indexOf(value) {
            return contents.removeAtIndex(index)
        }
        return nil
    }
}

extension SortedCollection: SequenceType {
    //typealias Generator = GeneratorOf<T>
    
    func generate() -> GeneratorOf<T> {
        var index = 0
        
        return GeneratorOf {
            if index < self.contents.count {
                return self.contents[index++]
            }
            return nil
        }
    }
}

extension SortedCollection: CollectionType {
    typealias Index = Int
    
    var startIndex: Int {
        return 0
    }
    
    var
}






