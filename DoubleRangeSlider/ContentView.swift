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
                //Color.yellow
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
                .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
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
        }
    }
}
//
//#Preview {
//    CircleDouble()
//}
