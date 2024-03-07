


// Lv1
class Calculator1 {
    
    func calculate(oper: String, firstNumber: Double, secondNumber: Double) -> Double {
        
        switch oper {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}

let calculator1 = Calculator1()
let addResult1 = calculator1.calculate(oper: "+", firstNumber: 8, secondNumber: 5)// 덧셈 연산
let subtractResult1 = calculator1.calculate(oper: "-", firstNumber: 8, secondNumber: 5)// 뺄셈 연산
let multiplyResult1 = calculator1.calculate(oper: "*", firstNumber: 8, secondNumber: 5)// 곱셈 연산
let divideResult1 = calculator1.calculate(oper: "/", firstNumber: 8, secondNumber: 5)// 나눗셈 연산

print("addResult : \(addResult1)")
print("subtractResult : \(subtractResult1)")
print("multiplyResult : \(multiplyResult1)")
print("divideResult : \(divideResult1)")
print("--------------------")



//Lv2
class Calculator2 {
    
    func calculate(oper: String, firstNumber: Double, secondNumber: Double) -> Double {
        
        switch oper {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        case "%":
            return Double(Int(firstNumber) % Int(secondNumber))
        default:
            return 0
        }
    }
}

let calculator2 = Calculator2()
let addResult2 = calculator2.calculate(oper: "+", firstNumber: 8, secondNumber: 5)
let subtractResult2 = calculator2.calculate(oper: "-", firstNumber: 8, secondNumber: 5)
let multiplyResult2 = calculator2.calculate(oper: "*", firstNumber: 8, secondNumber: 5)
let divideResult2 = calculator2.calculate(oper: "/", firstNumber: 8, secondNumber: 5)
let remainderResult2 = calculator2.calculate(oper: "%", firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult2)")
print("subtractResult : \(subtractResult2)")
print("multiplyResult : \(multiplyResult2)")
print("divideResult : \(divideResult2)")
print("remainderResult : \(remainderResult2)")
print("--------------------")



// Lv3
class Calculator3 {
    
    let add = AddOperation1()
    let subtract = SubtractOperation1()
    let multiply = MultiplyOperation1()
    let divide = DivideOperation1()
    let remainder = RemainderOperation1()
    
    func operate(oper: String, firstNumber: Double, secondNumber: Double) -> Double {
        switch oper {
        case "+":
            return add.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "-":
            return subtract.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "*":
            return multiply.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "/":
            return divide.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "%":
            return remainder.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            return 0
        }
    }
}

class AddOperation1 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation1 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation1 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation1 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

class RemainderOperation1 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return Double(Int(firstNumber) % Int(secondNumber))
    }
}

let calculator3 = Calculator3()

let addResult3 = calculator3.operate(oper: "+", firstNumber: 8, secondNumber: 5)
let subtractResult3 = calculator3.operate(oper: "-", firstNumber: 8, secondNumber: 5)
let multiplyResult3 = calculator3.operate(oper: "*", firstNumber: 8, secondNumber: 5)
let divideResult3 = calculator3.operate(oper: "/", firstNumber: 8, secondNumber: 5)
let remainderResult3 = calculator3.operate(oper: "%", firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult3)")
print("subtractResult : \(subtractResult3)")
print("multiplyResult : \(multiplyResult3)")
print("divideResult : \(divideResult3)")
print("remainderResult : \(remainderResult3)")
print("--------------------")



// Lv4
class AbstractOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return 0.0
    }
}

class AddOperation2: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation2: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation2: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation2: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

class RemainderOperation2: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return Double(Int(firstNumber) % Int(secondNumber))
    }
}

class Calculator4 {
    
    var oper: AbstractOperation
    
    init(oper: String) {
        self.oper = {
            switch oper {
            case "+":
                AddOperation2()
            case "-":
                SubtractOperation2()
            case "*":
                MultiplyOperation2()
            case "/":
                DivideOperation2()
            case "%":
                RemainderOperation2()
            default:
                AbstractOperation()
            }
        }()
    }
        
        func operate(firstNumber: Double, secondNumber: Double) -> Double {
            return oper.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }
}
    
let addResult4 = Calculator4(oper: "+").operate(firstNumber: 8, secondNumber: 5)
let subtractResult4 = Calculator4(oper: "-").operate(firstNumber: 8, secondNumber: 5)
let multiplyResult4 = Calculator4(oper: "*").operate(firstNumber: 8, secondNumber: 5)
let divideResult4 = Calculator4(oper: "/").operate(firstNumber: 8, secondNumber: 5)
let remainderResult4 = Calculator4(oper: "%").operate(firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult4)")
print("subtractResult : \(subtractResult4)")
print("multiplyResult : \(multiplyResult4)")
print("divideResult : \(divideResult4)")
print("remainderResult : \(remainderResult4)")






