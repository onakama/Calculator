//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by 住山大誠 on 2022/05/20.
//

import Foundation
class CalculatorViewModel : ObservableObject{
    @Published var result = 0
    let ButtonItem = [["7","8","9","÷"],
                      ["4","5","6","×"],
                      ["1","2","3","-"],
                      ["0","C","=","+"]]
    
    
    
}
