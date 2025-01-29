import UIKit

//var greeting: String
//print(greeting)
//
//greeting = "Hello, playground"

var greeting: String = "Hello, playground"

//var greeting = "Hello, playground"

//greeting = 10

var number: Double = 10

number = 10.1


number = 2.2

var intNumber = 5

var booleanVar: Bool = true
booleanVar = false

//number = Double(intNumber)
//greeting = String(10)

//(intNumber + Int(number)) * Int(greeting)!
//(Double(intNumber) + number) * Double(greeting)!

print(type(of: intNumber))
print(type(of: Double(intNumber)))
print(type(of: Double("10")))

//let stringResult: String
//
//if intNumber > 10 {
//    stringResult = "Int Number greater than 10"
//} else {
//    stringResult = "nope"
//}
//
//print(stringResult)
	

//let unsureInt = Int(greeting)
let unsureInt: Optional<Int> = Int(greeting)
let unsureInt1: Int? = nil

let someResult = (intNumber + Int(number)) * (unsureInt ?? unsureInt1 ?? 1)

let boolean1 = intNumber > 10 || intNumber < 6


let anotherGreeting = greeting

greeting = "10000"

//anotherGreeting.append("256")
let anotherGreetinAfterAppend = anotherGreeting.appending("256")

intNumber = Int(greeting)!

intNumber = greeting.count



print(intNumber)





print("Hello")

print(greeting)

greeting = "Hey!"

print(greeting)


