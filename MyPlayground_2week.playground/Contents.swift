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



func calc(a: Int, b: Int, method: (Int,Int) -> Int) -> Int {
    return method(a,b)
}

var res = calc(a: 1,b: 1) { (l:Int, r:Int) -> Int in return l+r}
print(res)


// exam closure
func myAge(v1: Int,block: (Int) -> String ) {
    
    print(block(v1))
}

myAge(v1: 29, block: { (val:Int) -> String in return "나의 나이는 \(val) 입니다."})

// 클로저가 마지막 인자로 올경우는 매개변수 이름을 생략하고 중괄호로 구현 할 수 있다.
myAge(v1: 39) { (val:Int) -> String in return "나의 나이는 \(val) 입니다."}

// 전달값과 리턴값의 타임 추론이 가능 하기 때문에 아래같이 축약이 가능 $0, $1, $2 .... 전달 변수는 이렇게 표현 가능
myAge(v1: 49) { "나의 나이는 \($0) 입니다."}

var point : (x: Int, y: Int) = (10,20)

if point.x == 10 || point.y == 50 {
    print("OK")
}

switch point {
case (0...10, 0..<10):
    print("OK")
case (let x, let y) where x == 10 || y == 10 :
    print("OK")
default:
    print("Error")
}





