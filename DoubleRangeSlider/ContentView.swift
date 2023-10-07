//  /*
//
//  Project: DoubleRangeSlider
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.10.2023
//
//  */

import SwiftUI

struct ContentView: View {
    @State var width: CGFloat = 0
    @State var widthTow: CGFloat = 15
    
    let offsetValue: CGFloat = 40
    
    @State var totalScreen: CGFloat = 0
    
    let maxValue: CGFloat = 1000
    
    @State var isDLeft = false
    @State var isDRight = false
    
    var lowerValue: Int {
        Int(map(value: width, from: 0...totalScreen, to: 0...maxValue))
    }
    var upperValue: Int {
        Int(map(value: widthTow, from: 0...totalScreen, to: 0...maxValue))
    }
    
    var body: some View {
        
        ZStack {
            Color(Color("BG"))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                GeometryReader(content: { geometry in
                    VStack(spacing: 40) {
                        Text("0 - 1000")
                            .font(.system(size: 20, weight: .bold, design: .serif))
                            .foregroundStyle(.white)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(height: 8)
                                .padding(.horizontal, 10)
                            
                            Rectangle()
                                .foregroundColor(.black.opacity(0.7))
                                .frame(width: widthTow - width, height: 10)
                                .offset(x: width + 20)
                            
                            HStack(spacing: 0) {
                                CircleDouble(isLeft: true, isDragging: $isDLeft, position: $width, otherPosition: $widthTow, limit: totalScreen)
                                CircleDouble(isLeft: false, isDragging: $isDRight, position: $widthTow, otherPosition: $width, limit: totalScreen)
                            }
                            
                            ValueBox(isDragging: isDLeft, value: lowerValue, position: width, xOffset: -18)
                            ValueBox(isDragging: isDRight, value: upperValue, position: widthTow, xOffset: -18)
                        }
                        .offset(y: 8)
                    }
                    .frame(width: geometry.size.width, height: 130)
                    .onAppear {
                        totalScreen = geometry.size.width - offsetValue
                    }
                })
                .frame(height: 130)
                .padding(.horizontal, 20)
                .background(
                    Color("BG"), in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
                .padding(.horizontal, 10)
                .shadow(color: .black, radius: 10, x: 10, y: 10)
            }
        }
    }
    
    func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound
        return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
    }
}

#Preview {
    ContentView()
}

struct CircleDouble: View {
    var isLeft: Bool
    
    @Binding var isDragging: Bool
    @Binding var position: CGFloat
    @Binding var otherPosition: CGFloat
    
    var limit: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.black.opacity(0.8))
        }
        .offset(x: position + (isLeft ? 0 : -5))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation {
                        isDragging = true
                    }
                    if isLeft {
                        position = min(max(value.location.x, 0), otherPosition)
                    } else {
                        position = min(max(value.location.x, otherPosition), limit)
                    }
                }).onEnded({ value in
                    withAnimation {
                        isDragging = false
                    }
                })
        )
    }
}

struct ValueBox: View {
    var isDragging: Bool
    var value: Int
    var position: CGFloat
    var xOffset: CGFloat

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 60, height: 40)
                .foregroundStyle(isDragging ? .black : .clear)
            
            Text("km\(value)")
                .foregroundStyle(isDragging ? .white : .clear)
        }
        .scaleEffect(isDragging ? 1 : 0)
        .offset(x: position + xOffset, y: isDragging ? -40 : 0)
    }
}

