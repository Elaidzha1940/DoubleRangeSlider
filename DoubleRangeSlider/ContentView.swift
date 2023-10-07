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
    
    @State var isLeft = false
    @State var isRight = false
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                //Color.yellow
                GeometryReader(content: { geometry in
                    VStack {
                        Text("0 - 1000")
                            .foregroundStyle(.white)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(height: 5)
                                .padding(.horizontal, 10)
                            
                            Rectangle()
                                .foregroundColor(.brown)
                                .frame(width: widthTow - width, height: 10)
                            
                        }
                    }
                    .frame(width: geometry.size.width, height: 130)
                })
                .frame(height: 130)
                //.padding(.horizontal, 20)
                .background(
                    .gray, in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    ContentView()
}
