//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
//STEP2
var lottoNumbers: Set<Int> = []

func pickLottoNumberUp () {
    var count: Int = 0
    while count < 6 {
        let randomNumer: Int = Int.random(in: 1...45)
        if !lottoNumbers.contains(randomNumer) {
            lottoNumbers.insert(randomNumer)
            count = count + 1
        }
    }
}

func matchLottoNumbers() -> Array<Int> {
    let matchedNumbers = Array(lottoNumbers.intersection(myLottoNumbers))
    return matchedNumbers
}

func printMatch(matchedNumbers: Array<Int>) {
    if matchedNumbers.isEmpty {
            print("아쉽지만 겹치는 번호가 없습니다")
        } else {
            let matchToPrint = convertArrayToString(someArray: matchedNumbers)
            print("축하합니다! 겹치는 번호는 \(matchToPrint) 입니다")
        }
    }

func convertArrayToString(someArray: Array<Int>) -> String {
    let someString = someArray.map { String($0) }.joined(separator: ", ")
    return someString
}

let myLottoNumbers: Set<Int> = [1, 8, 10, 23, 44, 36]

pickLottoNumberUp()
print("로또 당첨 번호: \(convertArrayToString(someArray: Array(lottoNumbers)))")
printMatch(matchedNumbers: matchLottoNumbers())

//STEP3
var winningLottoLog: [String: [Int]] = [:]
var lottoMatchedNumberLog: [String: [Int]] = [:]

func playLotto(endRound: Int) {
    for round in 1...endRound {
        pickLottoNumberUp()
        saveMatchedNumber(round: round)
        saveLotto(round: round)
    }
}

func saveLotto(round: Int) {
    winningLottoLog["\(round)회차"] = Array(lottoNumbers)
    lottoNumbers = []
}

func saveMatchedNumber(round: Int) {
    lottoMatchedNumberLog["\(round)회차"] = matchLottoNumbers()
}

func searchLottoRound(round: Int) {
    if let lottoHistory = winningLottoLog["\(round)회차"] {
        let searchNumbers = convertArrayToString(someArray: lottoHistory)
        print("\(round)회차의 로또 당첨 번호는 \(searchNumbers) 입니다.")
    }
}

func searchMatchedNumberRound(round: Int) {
    if let matchedHistory = lottoMatchedNumberLog["\(round)회차"] {
        let searchNumbers = convertArrayToString(someArray: matchedHistory)
        print("\(round)회차의 겹치는 번호는 \(searchNumbers) 입니다.")
    }
}

playLotto(endRound: 5)
searchLottoRound(round: 2)
searchMatchedNumberRound(round: 3)
