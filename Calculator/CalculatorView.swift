//
//  CalculatorView.swift
//  Calculator
//
//  Created by 住山大誠 on 2022/05/20.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel = CalculatorViewModel()
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("\(viewModel.result)")
                    .padding()
            }
            Spacer()
            ForEach((0...3), id: \.self) { row in
              HStack{
                ForEach((0...3), id: \.self){ col in
                  Button(action: {
                    // 条件分岐を加え、処理内容を変化させる
                  }){
                    Spacer()
                    Text(viewModel.ButtonItem[row][col])
                    Spacer()
                  }
                }
              }
              .padding(30)
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
