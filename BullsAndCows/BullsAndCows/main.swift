//
//  main.swift
//  BullsAndCows
//
//  Created by 박준영 on 3/11/24.
//

import Foundation

var numberArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var computersChoice = [Int]()
var myChoice = [Int]()
var strike = 0
var ball = 0

//컴퓨터가 숫자 랜덤 선택
for _ in 1...3 {
    let randomNumber = numberArr.randomElement()
    if let num = randomNumber {
        numberArr.remove(at: numberArr.firstIndex(of: num)!)
        computersChoice.append(num)
    }
}

print(computersChoice)
print("숫자를 입력하세요.")


while true {
    
    let userInput = readLine()
        
    if let input = userInput, let number = Int(input) {
        let stringArr = [String(number)]
        myChoice = stringArr.flatMap{ $0.compactMap{ Int(String($0)) } }
        //print(myChoice)
    }
    
    // 컴퓨터선택과 내선택 비교
    for i in 0...2 {
        for j in 0...2 {
            if computersChoice[i] == myChoice[j] {
                if i == j {
                    strike += 1
                } else { ball += 1 }
            }
        }
    }
    
    //비교 결과 출력
    if strike == 0, ball == 0 {
        print("Nothing")
    } else if strike > 0, ball == 0 {
        print("\(strike)스트라이크")
    } else if strike == 0, ball > 0 {
        print("\(ball)볼")
    } else { print("\(strike)스트라이크 \(ball)볼") }
    
    //초기화
    strike = 0
    ball = 0
    
    
}


// 예외 처리(입력값 숫자 아님, 세자리 아님, 중복 있음, 1~9 범위 넘어감)
