

class Calculator {
    
    let add = AddOperation()
    let subtract = SubtractOperation()
    let multiply = MultiplyOperation()
    let divide = DivideOperation()
    let remainder = RemainderOperation()
    
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

class AddOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        guard secondNumber != 0 else { return 0 }
        return firstNumber / secondNumber
    }
}

class RemainderOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return Double(Int(firstNumber) % Int(secondNumber))
    }
}

let calculator = Calculator()

let addResult = calculator.operate(oper: "+", firstNumber: 8, secondNumber: 5)
let subtractResult = calculator.operate(oper: "-", firstNumber: 8, secondNumber: 5)
let multiplyResult = calculator.operate(oper: "*", firstNumber: 8, secondNumber: 5)
let divideResult = calculator.operate(oper: "/", firstNumber: 8, secondNumber: 5)
let remainderResult = calculator.operate(oper: "%", firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("--------------------")
