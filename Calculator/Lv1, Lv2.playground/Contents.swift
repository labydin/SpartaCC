

class Calculator {
    
    func calculate(oper: String, firstNumber: Double, secondNumber: Double) -> Double {
        
        switch oper {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            guard secondNumber != 0 else {
                print("분모가 0이므로 나누기 불가능")
                return 0
            }
            return firstNumber / secondNumber
        case "%":
            return Double(Int(firstNumber) % Int(secondNumber))
        default:
            return 0
        }
    }
}

let calculator = Calculator()
let addResult = calculator.calculate(oper: "+", firstNumber: 8, secondNumber: 5)
let subtractResult = calculator.calculate(oper: "-", firstNumber: 8, secondNumber: 5)
let multiplyResult = calculator.calculate(oper: "*", firstNumber: 8, secondNumber: 5)
let divideResult = calculator.calculate(oper: "/", firstNumber: 8, secondNumber: 0)
let remainderResult = calculator.calculate(oper: "%", firstNumber: 8, secondNumber: 5)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
print("--------------------")
