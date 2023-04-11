import UIKit

// Working with String
let uppercaseClosure: (String) -> String = { str in
    return str.uppercased()
}
let uppercaseString = uppercaseClosure("hello")
print(uppercaseString)

// working with Int
let differenceClosure: (Int, Int) -> Int = { a, b in
    return a - b
}
let difference = differenceClosure(5, 3)
print(difference)

// working with array
let filterClosure: ([String], Character) -> [String] = { array, char in
    return array.filter { $0.first == char }
}
let filteredArray = filterClosure(["apple", "banana", "cherry", "date"], "b")
print(filteredArray)

// working with dictionary
let sumClosure: ([String: Int]) -> Int = { dictionary in
    return dictionary.values.reduce(0, +)
}
let dict = ["a": 1, "b": 2, "c": 3]
let sum = sumClosure(dict)
print(sum)

// working with Boolean
let isEvenClosure: (Int) -> Bool = { num in
    return num % 2 == 0
}
let isEven1 = isEvenClosure(5)
let isEven2 = isEvenClosure(6)
print(isEven1)
print(isEven2)

// escaping colure
func performAsyncOperation(completion: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion("Operation completed!")
    }
    print("This should print first")
}

performAsyncOperation { result in
    print(result)
}
