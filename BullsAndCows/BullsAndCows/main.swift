//
//  main.swift
//  BullsAndCows
//
//  Created by 박준영 on 3/11/24.
//

import Foundation

var numberArr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var computersChoice = [Int]()
var myChoice = [Int]()
var strike = 0
var ball = 0

//컴퓨터가 숫자 랜덤 선택
for i in 1...3 {
    let randomNumber: Int?
    
    if i == 1 {
        randomNumber = numberArr.dropFirst(1).randomElement()
    } else {
        randomNumber = numberArr.randomElement()
    }
    
    if let num = randomNumber, let index = numberArr.firstIndex(of: num){
        numberArr.remove(at: index)
        computersChoice.append(num)
    }
}

print(computersChoice)
print("숫자를 입력하세요.")


while true {
    
    let userInput = readLine()
        
    if let input = userInput, let number = Int(input) {
        let string = String(number)
        myChoice = string.compactMap{ Int(String($0)) }
        //print(myChoice)
    }
    
    // 컴퓨터선택과 내선택 비교
    for i in 0...2 {
        for j in 0...2 where computersChoice[i] == myChoice[j] {
                if i == j {
                    strike += 1
                } else { ball += 1 }
        }
    }
    
    //비교 결과 출력
    if strike == 0, ball == 0 {
        print("Nothing")
    } else if strike > 0, strike > 3, ball == 0 {
        print("\(strike)스트라이크")
    } else if strike == 0, ball > 0 {
        print("\(ball)볼")
    } else if strike == 3 {
        print("정답입니다!")
    } else { print("\(strike)스트라이크 \(ball)볼") }
    
    //초기화
    strike = 0
    ball = 0
    
    
}


// 예외 처리(입력값 숫자 아님, 세자리 아님, 중복 있음, 1~9 범위 넘어감)
enum InputError : Error {
    case notInt
    case notCount
    case duplication
    case outOfRange
}

