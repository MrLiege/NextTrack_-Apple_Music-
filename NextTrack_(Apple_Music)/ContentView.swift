//
//  ContentView.swift
//  NextTrack_(Apple_Music)
//
//  Created by Artyom on 06.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animation: Bool = false
    @Namespace private var imageValue
    
    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(stiffness: 100, damping: 50)) {
                animation.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    animation.toggle()
                }
            }
        }
    label: {
            HStack {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .scaleEffect(animation ? 1 : 0)
                    .opacity(animation ? 1 : 0)
                    .offset(x: animation ? 20 : 10)
                    .matchedGeometryEffect(id: "id", in: imageValue, isSource: true)
                
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .offset(x: animation ? 50 : 24)
                    .matchedGeometryEffect(id: "id", in: imageValue, isSource: false)
                
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .scaleEffect(animation ? 0 : 1)
                    .offset(x: animation ? 80 : 50)
                    .opacity(animation ? 0 : 1)
                    .matchedGeometryEffect(id: "id", in: imageValue, isSource: false)
            }
        }
    }
}

#Preview {
    ContentView()
}
