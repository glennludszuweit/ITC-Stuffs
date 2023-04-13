import UIKit

struct StuffDetail {
    let name: String
    let description: String
    let value: Int
}

protocol PrintDetails {
    func printDetails()
}

class Stuff {
    var id: Int?
    var stuffDetail: StuffDetail?
    
    required init(id: Int, stuffDetail: StuffDetail) {
        self.id = id
        self.stuffDetail = stuffDetail
    }
}

class MyStuff: Stuff, PrintDetails {
    var owner: String = "John Doe"
    var height: Int?
    
    init(height: Int, id: Int, stuffDetail: StuffDetail, owner: String){
        self.height = height
        self.owner = owner
        super.init(id: id, stuffDetail: stuffDetail)
    }
    
    required init(id: Int, stuffDetail: StuffDetail) {
        super.init(id: id, stuffDetail: stuffDetail)
    }
    
    func printDetails() {
        print("\(self.owner) who is \(self.height ?? 0)cm tall, have a \(self.stuffDetail?.name ?? ""), \(self.stuffDetail?.description ?? "") that cost \(self.stuffDetail?.value ?? 0)")
    }
}


let mobile: StuffDetail = {
    StuffDetail(name: "Mobile", description: "Apple 15 pro max", value: 500)
}()
let car: StuffDetail = {
    StuffDetail(name: "Car", description: "Mercedes Benz 500SL", value: 75000)
}()

let janesStuff = MyStuff(height: 173, id: 2, stuffDetail: car, owner: "Jane Doe")
let jakeStuff = MyStuff(height: 165, id: 3, stuffDetail: mobile, owner: "Jake Doe")

janesStuff.printDetails()
jakeStuff.printDetails()

