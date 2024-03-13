//
//  ContentView.swift
//  MeditationApp
//
//  Created by Surya Sharma on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack{
                Text("MEDITATION")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .tracking(10)
                    .padding(.all)
                Spacer()
                TimerView()
            }
                CircleView()
               // .offset(x:0, y:-150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
