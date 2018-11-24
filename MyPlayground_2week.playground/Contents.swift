import UIKit

var str = "study swift 2 week"


var i = 10
repeat {
    print(i)
    i+=1
}while i < 10

let stringNum = ["prime" : [2,3,4,5,6], "kms" : [12,23,24,25,26], "smrit": [22,23,24,25,26]]


for (key, num) in stringNum {
    for n in num {
        print("\(key), \(n)")
    }
    print("")
}

// byte swap
var data1:UInt16 = 256
print( String(format: "[%04X]", data1))

var r_data = data1.byteSwapped
print( String(format: "[%04X]", r_data))


var today = (
    {
    (month: String, day: String) -> String in
    return "오늘은 \(month), \(day) 입니다."
    }
)
print(today("1","2"))



// 리턴값 없는 경우 1
print(
    {
        (month: String, day: String) -> () in
        return "오늘은 \(month), \(day) 입니다."
    }
)

// 리터값 없는 경우 2
print(
    {
        (month: String, day: String) in
        return "오늘은 \(month), \(day) 입니다."
    }
)
