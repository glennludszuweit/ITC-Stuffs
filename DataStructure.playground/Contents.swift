//import UIKit

//struct Store {
//    let key: String
//    let value: Int
//    let priority: Int
//    let expiration: Double
//}
//
//class StoreClass {
//    var storeArr = [
//        Store(key: "a", value: 3, priority: 5, expiration: 11005.0),
//        Store(key: "b", value: 5, priority: 5, expiration: 800.0),
//        Store(key: "c", value: 8, priority: 5, expiration: 11000.55),
//        Store(key: "d", value: 8, priority: 1, expiration: 11002.55),
//        Store(key: "e", value: 8, priority: 5, expiration: 11003.55)
//    ]
//
//    func get(key: String) -> Int? {
//        let res = storeArr.filter {$0.key == key}
//        if res.first != nil {
//            return res.first?.value ?? 0
//        } else {
//            return nil
//        }
//    }
//
//    func set(store: Store, expTime: Double) {
//        storeArr.map{ element in
//
//            if let index = storeArr.firstIndex(where: { $0.expiration < expTime }) {
//                storeArr[index] = store
//            } else if let lowestPriorityIndex = storeArr.indices.min(by: { storeArr[$0].priority < storeArr[$1].priority }) {
//                storeArr[lowestPriorityIndex] = store
//            } else if storeArr.allSatisfy({ $0.priority == storeArr.first?.priority }) {
//                storeArr[0] = store
//            }
//        }
//    }
//}
//
//let S = StoreClass()
//
//S.set(store: Store(key: "f", value: 8, priority: 5, expiration: 41003.55), expTime: 900.5)
//
//S.storeArr

import Foundation

struct Store {
    let key: String
    let value: Int
    let priority: Int
    let expiration: Double
}

func removeExpired(store: [Store], expTime: Double) -> [Store] {
    store.reduce(into: [Store]()) { result, element in
        result.append(element)
        if let index = result.firstIndex(where: { $0.expiration < expTime }) {
            result.remove(at: index)
        }
    }
}



var storeArr = [
    Store(key: "a", value: 3, priority: 5, expiration: 11005.0),
    Store(key: "b", value: 5, priority: 5, expiration: 800.0),
    Store(key: "c", value: 8, priority: 5, expiration: 11000.55),
    Store(key: "d", value: 8, priority: 1, expiration: 11002.55),
    Store(key: "e", value: 8, priority: 5, expiration: 11003.55)
]
//storeArr = storeArr.filter {$0.expiration > 900.5}
//storeArr = removeExpired(store: storeArr, expTime: 900.0)

func get(key: String) -> Int? {
    let res = storeArr.filter {$0.key == key}
    if res.first != nil {
        return res.first?.value ?? 0
    } else {
        return nil
    }
}

func set(store: Store, expTime: Double) {
    let newArr = storeArr.reduce(into: [Store]()) { result, element in
        result.append(element)
        if let index = result.firstIndex(where: { $0.expiration < expTime }) {
            result[index] = store
        }
    }
    
    if storeArr.allSatisfy({ $0.priority == storeArr.first?.priority }) {
        storeArr.remove(at: 0)
        storeArr.append(store)
    } else {
        if let lowestPriorityIndex = storeArr.indices.min(by: { storeArr[$0].priority < storeArr[$1].priority }) {
            storeArr[lowestPriorityIndex] = store
        }
    }
    
}

set(store: Store(key: "f", value: 8, priority: 5, expiration: 11223.55), expTime: 900.5)
storeArr
//get(key: "h")
