//
//  File.swift
//  BullsAndCows
//
//  Created by 박준영 on 3/12/24.
//

import Foundation

struct BaseballGame {
    
    var recordArr: [Int] = []
    
    
    mutating func intro() {
        
        print("환영합니다! 원하시는 번호를 입력하세요.")
        print("1. 게임 시작하기   2. 게임 기록 보기   3. 종료하기")
        
        while true {

            guard let input = readLine(), let number = Int(input) else {
                print("숫자가 아닙니다.")
                continue }
            switch number {
            case 1:
                start()
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
    
    
    mutating func start() {
        print("< 게임을 시작합니다 >")
        print("숫자를 입력하세요.")
        
        let answer = makeAnswer()
        print(answer)
        var trialCount = 0
        
        while true {
            
            var myChoice: [Int] = []
            var strike = 0
            var ball = 0
            
            if let input = readLine(), let number = Int(input)  {
                myChoice = String(number).compactMap{ Int(String($0)) }
                trialCount += 1
                print(trialCount)
            } else {
                print("숫자가 아닙니다.")
                trialCount += 1
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
            
            
            // 컴퓨터선택과 내선택 비교
            for i in 0...2 {
                for j in 0...2 where answer[i] == myChoice[j] {
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
                recordArr.append(trialCount)
                trialCount = 0
                print(recordArr)
                intro()
            } else { print("\(strike)스트라이크 \(ball)볼") }
            
        }
    }
      
    
    func makeAnswer() -> [Int] {
        var numArr = Array(0...9)
        var computersChoice = [Int]()
        
        for i in 1...3 {
            let randomNumber: Int?
            
            if i == 1 { randomNumber = numArr.dropFirst(1).randomElement() }
            else { randomNumber = numArr.randomElement() }
            
            if let num = randomNumber, let index = numArr.firstIndex(of: num) {
                numArr.remove(at: index)
                computersChoice.append(num)
            }
        }
        return computersChoice
    }
    
    
    func recordManager(_ arr: [Int]) {
    
        print("< 게임 기록 보기 >")
        for (offset, value) in arr.enumerated() {
            print("\(offset + 1)번째 게임 : 시도 횟수 - \(value)")
        }
        

    }
}
