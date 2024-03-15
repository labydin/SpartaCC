//
//  File.swift
//  BullsAndCows
//
//  Created by 박준영 on 3/12/24.
//

import Foundation

struct BaseballGame {
    
    var recordArr: [Int] = []
    var trialCount = 0
    
    
    mutating func intro() {
        print("환영합니다! 원하시는 번호를 입력하세요.")
        print("1. 게임 시작하기   2. 게임 기록 보기   3. 종료하기")
        
        while true {

            guard let input = readLine(), let number = Int(input) else {
                print("숫자가 아닙니다.")
                continue }
            switch number {
            case 1:
                playGame()
            case 2:
                recordManager(recordArr)
            case 3:
                print("< 숫자 야구게임을 종료합니다 >")
                exit(0)
            default:
                print("올바른 숫자를 입력해 주세요.")
            }
        }
    }
    
    
    
    mutating func playGame() {
        print("< 게임을 시작합니다 >")
        print("숫자를 입력하세요.")
        
        let answer = makeAnswer()
        var myChoice: [Int] = []
        
        while true {

            if let input = readLine(), let number = Int(input)  {
                myChoice = String(number).compactMap{ Int(String($0)) }
            } else {                                                          //올바른 입력 조건 아닐 경우
                print("숫자가 아닙니다.")
                continue }
            
            if myChoice.count != 3 {
                print("세자리 숫자가 아닙니다.")
                continue
            } else if myChoice[0] == 0 {
                print("첫번째 자리에는 0이 들어갈 수 없습니다.")
                continue
            } else if myChoice[0] == myChoice[1] || myChoice[0] == myChoice[2] || myChoice[1] == myChoice[2] {
                print("숫자가 중복되었습니다.")
                continue }
            
            comparison(answer, myChoice)
        }
    }
            
    
    
    mutating func comparison(_ com: [Int], _ mine: [Int]) -> () {
        var strike = 0
        var ball = 0
        
        trialCount += 1
        
        for (i, value) in mine.enumerated() {
            if com[i] == mine[i] {
                strike += 1
            } else if com.contains(value) {
                ball += 1
            }
        }
        
        if strike == 0, ball == 0 {                     // 결과 출력
            print("Nothing")
        } else if strike == 3 {
            print("정답입니다!")
            recordArr.append(trialCount)
            trialCount = 0
            intro()
        } else {
            print("\(strike)스트라이크", terminator: " ")
            print("\(ball)볼")
        }
    }

      
    
    func makeAnswer() -> [Int] {
        var numArr = Array(0...9)
        var computersChoice = [Int]()
        
        for i in 1...3 {
            let randomNumber: Int?
            
            if i == 1 { randomNumber = numArr.dropFirst(1).randomElement()
            } else { randomNumber = numArr.randomElement() }
            
            if let num = randomNumber, let index = numArr.firstIndex(of: num) {
                numArr.remove(at: index)
                computersChoice.append(num)
            }
        }
        return computersChoice
    }
    
    
    
    func recordManager(_ arr: [Int]) -> () {
        print("< 게임 기록 보기 >")
        
        if arr.isEmpty {
            print("게임 기록이 없습니다.")
        }
        
        for (offset, value) in arr.enumerated() {
            print("\(offset + 1)번째 게임 : 시도 횟수 - \(value)")
        }
    }
    
    
}
