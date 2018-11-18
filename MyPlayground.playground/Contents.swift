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


print("---------------------------------------------")
var name = [String]()
name.append("lee")
name.append("park")
name.append("kim")

print(name[0])
print(name[1])
print(name[2])

var array: [Any] = [1,2,"aa","bb"]
for arr in array {
    print(arr)
}
print("---------------------------------------------")
var testVal:[Int]!
testVal = [Int]()

testVal.append(10)
testVal.append(11)

print(testVal[0])
print(testVal[1])
print("---------------------------------------------")



var i:Int = 0
for _ in 1..<10 {
    print(i)
    i += 1
}
print("---------------------------------------------")
for _ in 1..<10 {
    print(i)
    i -= 1
}

var names = ["lee", "kim", "park"]
for name in names {
    print(name)
}

for i in 0..<name.count {
    print(name[i])
}

for (index, name) in name.enumerated() {
    print("\(index) :: \(name)")
}
print("---------------------------------------------")

for x in 2..<10 {
    print("-------------------------------------------")
    for y in 1..<10 {
        print("\(x) x \(y) = \(x * y)")
    }
}

