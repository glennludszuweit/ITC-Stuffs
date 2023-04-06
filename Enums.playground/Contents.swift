import UIKit

// syntax and usage
enum Meal {
    case breakfast
    case lunch
    case dinner
}

func whichMeal (_ meal: Meal) {
    switch meal {
    case .breakfast:
        print(meal)
    case .lunch:
        print(meal)
    case .dinner:
        print(meal)
    }
}

whichMeal(Meal.breakfast)

// raw values
enum Food: Int {
    case sandwich
    case pasta
    case salad
}

let food = Food(rawValue: 1)
print(food!)

// associated values
enum FoodPrice {
    case barCode(Int, Int, Int)
    case qrCode(String)
}

let foodPrice = FoodPrice.barCode(213, 1, 3434)
print(foodPrice)

// methods
enum Device {
    case iPad
    case iPhone
    
    func introduced() -> String {
        switch self {
            case .iPhone:
                return "\(self) was introduced 2007"
            case .iPad:
                return "\(self) was introduced 2010"
        }
    }
}

let device = Device.iPhone
print (device.introduced())
