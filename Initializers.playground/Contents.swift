import UIKit

struct StuffDetail {
    let name: String
    let description: String
    let value: Int
}

class Stuff {
    var id: Int?
    var stuffDetail: StuffDetail?
    
    required init(id: Int, stuffDetail: StuffDetail) {
        self.id = id
        self.stuffDetail = stuffDetail
    }
}

class MyStuff: Stuff {
    var owner: String = "John Doe"
    
    required init(id: Int, stuffDetail: StuffDetail, owner: String) {
        self.owner = owner
        super.init(id: 1, stuffDetail: StuffDetail(name: "Car", description: "Mercedes Benz 500SL", value: 75000))
    }
    
    required init(id: Int, stuffDetail: StuffDetail) {
        fatalError("init(id:stuffDetail:) has not been implemented")
    }
}


let stuffDetail: StuffDetail = {
    StuffDetail(name: "Mobile", description: "Apple 15 pro max", value: 500)
}()

let janesStuff = MyStuff(id: 2, stuffDetail: stuffDetail, owner: "Jane Doe")

print(janesStuff.stuffDetail)
