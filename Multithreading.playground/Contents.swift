import UIKit

// GCD
// Get a reference to a global queue with background priority
let backgroundQueue = DispatchQueue.global(qos: .background)

// Run a task asynchronously on the background queue
backgroundQueue.async {
    // Perform some long-running operation here
    print("Task running on background thread")
}

// Global Queue
// Get a reference to a global queue with default priority
let globalQueue = DispatchQueue.global()

// Run a task asynchronously on the global queue
globalQueue.async {
    // Perform some work here
    print("Task running on global queue")
}

// Custom/Serial Queue
// Create a serial queue with a custom label
let customQueue = DispatchQueue(label: "com.example.customqueue")

// Run a task asynchronously on the custom queue
customQueue.async {
    // Perform some work here
    print("Task running on custom queue")
}

// Create a serial queue with a custom label
let serialQueue = DispatchQueue(label: "com.example.serialqueue")

// Perform a task synchronously on the serial queue
serialQueue.sync {
    // Perform some work here
    print("Synchronous task running on serial queue")
}

// Perform a task asynchronously on the serial queue
serialQueue.async {
    // Perform some work here
    print("Asynchronous task running on serial queue")
}

// Create a concurrent queue with a custom label
let concurrentQueue = DispatchQueue(label: "com.example.concurrentqueue", attributes: .concurrent)

// Perform a task synchronously on the concurrent queue
concurrentQueue.sync {
    // Perform some work here
    print("Synchronous task running on concurrent queue")
}

// Perform a task asynchronously on the concurrent queue
concurrentQueue.async {
    // Perform some work here
    print("Asynchronous task running on concurrent queue")
}
