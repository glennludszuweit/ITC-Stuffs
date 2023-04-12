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
    
    required init(id: Int, stuffDetail: StuffDetail, owner: String) {
        self.owner = owner
        super.init(id: id, stuffDetail: stuffDetail)
    }
    
    required init(id: Int, stuffDetail: StuffDetail) {
        fatalError("init(id:stuffDetail:) has not been implemented")
    }
    
    func printDetails() {
        print("\(self.owner) have a \(self.stuffDetail?.name ?? "") \(self.stuffDetail?.description ?? "") that cost \(self.stuffDetail?.value ?? 0)")
    }
}


let mobile: StuffDetail = {
    StuffDetail(name: "Mobile", description: "Apple 15 pro max", value: 500)
}()
let car: StuffDetail = {
    StuffDetail(name: "Car", description: "Mercedes Benz 500SL", value: 75000)
}()

let janesStuff = MyStuff(id: 2, stuffDetail: car, owner: "Jane Doe")
let jakeStuff = MyStuff(id: 3, stuffDetail: mobile, owner: "Jake Doe")

janesStuff.printDetails()
jakeStuff.printDetails()
