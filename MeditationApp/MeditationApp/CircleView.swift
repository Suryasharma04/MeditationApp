//
//  CircleView().swift
//  MeditationApp
//
//  Created by Surya Sharma on 9/2/23.
//

import SwiftUI

struct CircleView : View {
    @State private var change = false
    @State private var breathe = true
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 150, height: 150)
                .foregroundColor(Color.white)
                .scaleEffect(change ? 2 : 1)
                .opacity(change ? 0.5 : 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).speed(0.2))
                .onAppear(){
                    self.change.toggle()
                    
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                        withAnimation {
                            self.breathe.toggle()
                        }
                }
        }
                .offset(x:0, y:-150)
            
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 130)
                .shadow(radius: 25)
                .offset(x:0, y:-150)
                
            Image(systemName: "circle.fill")
                .font(.system(size: 120))
                .foregroundColor(Color.black)
                .shadow(radius: 25)
                .offset(x:0, y:-150)
            
            Text(breathe ? "inhale" : "exhale")
                .offset(x:0, y:-150)
                .foregroundColor(.white)
        }
        
    }
}

struct CircleView___Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
