// Playground - noun: a place where people can play
import Foundation
import UIKit



class Node {
    var data: String = ""
    var next: Node? = nil
    
    init(data: String, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


let n1 = Node(data: "1", next: nil)
let n2 = Node(data: "2", next: nil)
let n3 = Node(data: "3", next: nil)
let n4 = Node(data: "4", next: nil)

var head: Node? = n1
n1.next = n2; n2.next = n3; n3.next = n4

var t = head
while t != nil {
    println(t?.data)
    t = t?.next
}

func myreverse(inout head: Node?) {
    var p: Node? = head!.next
    var q: Node? = head!.next?.next
    head!.next = nil
    
    while p != nil {
        p?.next = head
        head = p
        p = q
        q = q?.next
    }
}

myreverse(&head)

t = head
while t != nil {
    println(t?.data)
    t = t?.next
}
