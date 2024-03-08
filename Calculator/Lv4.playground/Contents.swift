

class AbstractOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return 0.0
    }
}

class AddOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class MultiplyOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        guard secondNumber != 0 else { return 0 }
        return firstNumber / secondNumber
    }
}

class RemainderOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return Double(Int(firstNumber) % Int(secondNumber))
    }
}

class Calculator {
    
    var oper: AbstractOperation?
        
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return oper?.operate(firstNumber: firstNumber, secondNumber: secondNumber) ?? 0
        }
}


let calculator = Calculator()

calculator.oper = AddOperation()
let addResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = SubtractOperation()
let subtractResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = MultiplyOperation()
let multiplyResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = DivideOperation()
let divideResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = RemainderOperation()
let remainderResult = calculator.operate(firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("--------------------")
