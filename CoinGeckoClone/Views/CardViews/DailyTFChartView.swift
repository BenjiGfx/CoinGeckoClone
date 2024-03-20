//
//  DailyTFChartView.swift
//  CoinGeckoClone
//
//  Created by Benjamin Ott on 20.02.24.
//

import SwiftUI

struct DailyTFChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color

    init(dailyTF: DailyTFModel) {
        data = dailyTF.prices.map{$0.price}
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.green : Color.red
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let price = data[index]
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    let yAxis = maxY - minY
                    let yPosition = (1 - CGFloat((price - minY) / yAxis)) * geometry.size.height
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
        .padding(.horizontal)
        .frame(height: 300)
        .padding()
        .background(
            VStack {
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
            }
            .padding()
        )
        .overlay(
            VStack {
                HStack {
                    Text(String(format: "%.2f$", maxY))
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                HStack {
                    Text(String(format: "%.2f$", (maxY + minY) / 2))
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                HStack {
                    Text(String(format: "%.2f$", minY))
                    Spacer()
                }
                .padding(.horizontal)
            }
        )
        .foregroundColor(.black)
        .font(.footnote)
    }
}

struct DailyTFChartView_Previews: PreviewProvider {
    static var previews: some View {
        DailyTFChartView(dailyTF: DailyTFViewModel().dailyTF)
    }
}
