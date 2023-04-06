import UIKit

class Numbers {
    var numberWords: [Int:String] = [:]
    
    func populateNumberWords() {
        for i in 0..<10 {
            let word = self.generateNumberWord(num: i)
            self.numberWords[i] = word
        }
    }
    
    func generateNumberWord (num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        let number = num
        let word = formatter.string(for: number)!
        return word
    }
    
    func displayDetails(num: Int) -> (Int, String) {
        return (num, self.numberWords[num]!)
    }
}

class TeenNumbers: Numbers {
    override func populateNumberWords() {
        for i in 10..<20 {
            let word = self.generateNumberWord(num: i)
            super.numberWords[i] = word
        }
    }
}



let numbers = Numbers()
let teenNumbers = TeenNumbers()

numbers.populateNumberWords()
teenNumbers.populateNumberWords()

numbers.numberWords
teenNumbers.numberWords

numbers.displayDetails(num: 6).0
teenNumbers.displayDetails(num: 11).1
