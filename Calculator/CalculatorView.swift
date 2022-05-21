//
//  CalculatorView.swift
//  Calculator
//
//  Created by 住山大誠 on 2022/05/20.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject var viewModel = Calculator()
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(viewModel.result)
                    .font(.system(size: 80, weight: .light))
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
            }
            Spacer()
            ForEach((0...3), id: \.self) { highCount in
              HStack{
                ForEach((0...3), id: \.self){ rowCount in
                  Button(action: {
                      viewModel.buttonActionHandle(item: viewModel.ButtonItem[highCount][rowCount])
                  }){
                    Spacer()
                    Text(viewModel.ButtonItem[highCount][rowCount])
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
