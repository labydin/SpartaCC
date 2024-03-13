

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
        do {
            try DivideOperateThrows(number: secondNumber)
        } catch {
            print("분모가 0이므로 나누기 불가능")
        }
        return firstNumber / secondNumber
    }
}

class RemainderOperation: AbstractOperation {
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return Double(Int(firstNumber) % Int(secondNumber))    //truncatingRainder(dividingBy:)
    }
}


class Calculator {
    
    var oper: AbstractOperation
    
    init(oper: AbstractOperation) {
        self.oper = oper
    }
        
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return oper.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }
}

//에러 처리
enum DivideError: Error {
    case secondNumberIsZero
}

func DivideOperateThrows(number: Double) throws -> Double {
    guard number != 0 else { throw DivideError.secondNumberIsZero }
    return number
}


let calculator = Calculator(oper: AddOperation())

let addResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = SubtractOperation()
let subtractResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = MultiplyOperation()
let multiplyResult = calculator.operate(firstNumber: 8, secondNumber: 5)
calculator.oper = DivideOperation()
let divideResult = calculator.operate(firstNumber: 8, secondNumber: 0)
calculator.oper = RemainderOperation()
let remainderResult = calculator.operate(firstNumber: 10.5, secondNumber: 3)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("--------------------")
