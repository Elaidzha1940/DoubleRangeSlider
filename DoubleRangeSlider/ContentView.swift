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
            
            GeometryReader(content: { geometry in
                VStack {
                    Text("0 - 1000")
                        .foregroundStyle(.white)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .frame(height: 5)
                        
                    }
                }
                .frame(width: geometry.size.width, height: 130)
            })
            .frame(height: 130)
        }
    }
}

#Preview {
    ContentView()
}
