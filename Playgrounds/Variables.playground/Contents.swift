import UIKit

var persons : [PersonDetails]  = []

struct PersonDetails {
    var name: String
    var age: Int
}

class Person {
    var name: String?
    var age: Int?
    
    init() {}
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // just for assignment
    func getPersonDetails() -> (String, Int) {
        if self.name != nil && self.age != nil {
            return (self.name!, self.age!)
        } else {
            return ("" , 0)
        }
    }
}



let person1 = Person(name: "Tony", age: 7)
let person2 = Person(name: "Gregg", age: 5)
let person3 = Person()

let person3Details = person3.getPersonDetails()

let person1Details = person1.getPersonDetails()
print(person1Details)
print(person3Details)

persons.append(PersonDetails(name: person1.name!, age: person1.age!))
persons.append(PersonDetails(name: person2.name!, age: person2.age!))

for person in persons {
    print("\(person.name) is \(person.age) years old.")
}
