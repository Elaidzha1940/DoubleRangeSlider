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
    
    var body: some View {
        
        ZStack {
            Color(Color("BG"))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                GeometryReader(content: { geometry in
                    VStack {
                        Text("0 - 1000")
                            .font(.system(size: 20, weight: .bold, design: .serif))
                            .foregroundStyle(.white)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(height: 8)
                                .padding(.horizontal, 10)
                            
                            Rectangle()
                                .foregroundColor(.brown)
                                .frame(width: widthTow - width, height: 10)
                            
                            HStack(spacing: 0) {
                                CircleDouble(isLeft: true, isDragging: $isDLeft, position: $width, otherPosition: $widthTow, limit: totalScreen)
                                CircleDouble(isLeft: false, isDragging: $isDRight, position: $widthTow, otherPosition: $width, limit: totalScreen)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: 130)
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
                .foregroundColor(.black)
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
                })
        )
    }
}
