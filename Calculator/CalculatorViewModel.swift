//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by 住山大誠 on 2022/05/20.
//

import Foundation

enum CaluculateState {
    case initial
    case sum
    case difference
    case product
    case quotient
}

class CalculatorViewModel : ObservableObject{
    @Published var result = "0"
    //四則演算の状態
    @Published var caluculateState = CaluculateState.initial
    //直前のボタンが四則演算
    @Published var justArithmetic = false
    
    private var waitNum: Int?
    private let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    private let symbols = ["+", "-", "×", "÷", "="]
    let ButtonItem = [["7","8","9","÷"],
                      ["4","5","6","×"],
                      ["1","2","3","-"],
                      ["0","C","=","+"]]
    func buttonActionHandle(item: String) {
        if numbers.contains(item) {
            if justArithmetic {
                result = "0"
                justArithmetic = false
            }
            if result.count >= 10 {
                return
            }
            if result == "0" {
                result = item
                return
            }
            result += item
        } else if item == "C"{
            caluculateState = .initial
            justArithmetic = true
            result = "0"
            return
        }
        guard let resultInt: Int = Int(result) else { return }
        if item == "+" {
            caluculateState = .sum
            justArithmetic = true
            waitNum = resultInt
        } else if item == "-" {
            caluculateState = .difference
            justArithmetic = true
            waitNum = resultInt
        } else if item == "×" {
            caluculateState = .product
            justArithmetic = true
            waitNum = resultInt
        } else if item == "÷" {
            caluculateState = .quotient
            justArithmetic = true
            waitNum = resultInt
        } else if item == "=" {
            guard let waitNum = waitNum else { return }
            result = String(caluculate(num: resultInt, waitNum: waitNum, caluculateState: caluculateState))
        }
    }
    func caluculate(num: Int, waitNum: Int, caluculateState: CaluculateState) -> Int {
        switch caluculateState {
        case .sum:
            return waitNum + num
        case .difference:
            return waitNum - num
        case .product:
            return waitNum * num
        case .quotient:
            return waitNum / num
        default:
            return 0
        }
    }
}
