import UIKit

let fruitArr = ["apple", "banana", "cherry", "date", "elderberry"]
let nameArr = ["Alice", "Bob", "Charlie", "David", "Eve"]

// GCD
// Get a reference to a global queue with background priority
let backgroundQueue = DispatchQueue.global(qos: .background)
backgroundQueue.async {
    // Perform some long-running operation here
}

// Global Queue

// Get a reference to a global queue with default priority
let globalQueue = DispatchQueue.global()
globalQueue.async {
    // Perform some work here
}

// Custom/Serial Queue
// Create a serial queue with a custom label
let customQueue = DispatchQueue(label: "com.example.customqueue")
customQueue.async {
    // Perform some work here
}

// Create a serial queue with a custom label
let serialQueue = DispatchQueue(label: "com.example.serialqueue")
serialQueue.sync {
    // Perform some work here
}
serialQueue.async {
    // Perform some work here
}

// Create a concurrent queue with a custom label
let concurrentQueue = DispatchQueue(label: "com.example.concurrentqueue", attributes: .concurrent)
concurrentQueue.sync {
    // Perform some work.
}
concurrentQueue.async {
    print("start")
    for x in fruitArr {
        print(x)
    }
    print("end")
}
concurrentQueue.async {
    print("start")
    for x in nameArr {
        print(x)
    }
    print("end")
}

