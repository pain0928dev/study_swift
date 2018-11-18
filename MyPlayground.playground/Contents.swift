import UIKit

var str = "Hello, playground"

func showName(name: String, age: Int){
    print("Name: \(name), Age: \(age)")

}

var age = 29
showName(name: "LeeJH", age: age)
print("ReAge: \(age)")

func sumAll(_ number: UInt...){
    var sum:UInt = 0
    for num in number {
        sum = sum + num
    }
    
    print("Reult: \(sum)")
}

sumAll(1,2,3,4,5,6,7,8,9,10)
