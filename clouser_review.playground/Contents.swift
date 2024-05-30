import UIKit




var num = 9

func addTwoNumbers(a: Int, b: Int) -> Int{
    return a + b
}

var myFirstFunc = {(a: Int, b: Int)->Int in
        return a + b
}



myFirstFunc(33,44)



func doMath(a: Int, b: Int, op: (Int,Int)->Int) -> Int {
    return op(a,b)
}

doMath(a: 33, b: 66, op: myFirstFunc)



doMath(a: 22, b: 11) { a, b in
    return a + b
}

doMath(a: 19, b: 2) { a, b in
    return a - b
}

doMath(a: 90, b: 2) { a, b in
    return a * b
}
