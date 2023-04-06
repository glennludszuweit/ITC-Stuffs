import UIKit

struct Car {
  var make: String
  var model: String
  var year: Int
}

let carArray: [Car] = [
  Car(make: "Toyota", model: "Corolla", year: 2022),
  Car(make: "Honda", model: "Civic", year: 2021),
  Car(make: "Ford", model: "Mustang", year: 2020),
  Car(make: "Chevrolet", model: "Camaro", year: 2022),
  Car(make: "BMW", model: "X5", year: 2021),
  Car(make: "Mercedes-Benz", model: "C-Class", year: 2020),
  Car(make: "Tesla", model: "Model S", year: 2022),
  Car(make: "Audi", model: "A4", year: 2021),
  Car(make: "Lexus", model: "RX", year: 2020),
  Car(make: "Porsche", model: "911", year: 2022)
]



//MAP - return array of car models
let carModels = carArray.map{$0.model}
print(carModels)

//FILTER - filter new cars
print()
let newCars = carArray.filter{ $0.year >= 2022 }
print(newCars)
newCars.forEach{ car in print("\(car.year) \(car.make) \(car.model)") }

//REDUCE - create dictionary from structured array
print()
let oldCars = carArray.reduce(into: [:]) { (dict, car) in
    if car.year < 2022 {
        dict["\(car.make)"] = "\(car.model) \(car.year)"
    }
}
print(oldCars)
oldCars.forEach{ car in print("\(car.key) \(car.value)") }

//SORT - sort cars by year
print()
let sortedCarsByYear = carArray.sorted{$0.year < $1.year}
print(sortedCarsByYear)
sortedCarsByYear.forEach{car in print("\(car.year) - \(car.make) \(car.model)")}
