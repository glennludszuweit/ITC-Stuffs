import UIKit

let someOperation1 = BlockOperation {
    print("BlockOperation 1")
}

let someOperation2 = BlockOperation {
    print("BlockOperation 2")
}

// compose array of operations
let operationQueue = OperationQueue()
print("Before Eod")
someOperation1.addDependency(someOperation2)
operationQueue.addOperations([someOperation1, someOperation2], waitUntilFinished: false)
operationQueue.maxConcurrentOperationCount = 1
print("After Eod")
