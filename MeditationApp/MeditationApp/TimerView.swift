//
//  TimerView.swift
//  MeditationApp
//
//  Created by Surya Sharma on 9/2/23.
//

import SwiftUI

struct TimerView: View {
    @State private var inputHours = 0
    @State private var inputMinutes = 0
    @State private var inputSeconds = 0
    @State private var timer = 0
    @State private var isEnabled = false
    
    let hours = Array(0...24)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    var body: some View {
        VStack{
            Text("\(formattedTime(timer))")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black)
            
            if !isEnabled {
                HStack {
                    Picker("Hours", selection: $inputHours) {
                        ForEach(hours, id: \.self) { option in
                            Text("\(option) hour")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Picker("Minutes", selection: $inputMinutes) {
                        ForEach(minutes, id: \.self) { option in
                            Text("\(option) min")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .fontWeight(.regular)
                    .frame(width: 100)
                    
                    Picker("Seconds", selection: $inputSeconds) {
                        ForEach(seconds, id: \.self) { option in
                            Text("\(option) sec")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .fontWeight(.regular)
                    .frame(width: 100)
                }
            }
        }
        
        HStack {
            Button(action: {
                if isEnabled {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }) {
                Text(isEnabled ? "Pause" : (timer > 0 ? "Resume" : "Start"))
                    .font(.system(size: 15))
                    .frame(width: 80)
                    .padding(15)
                    .background(isEnabled ? Color.red.opacity(0.6) : .orange.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(100)
            }
            .disabled(inputHours == 0 && inputMinutes == 0 && inputSeconds == 0)
            
            Button(action: {
                resetTimer()
            }) {
                Text("Reset")
                    .font(.system(size: 15))
                    .frame(width: 80)
                    .padding(15)
                    .background(.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(100)
            }
            .disabled(timer == 0 || (!isEnabled && timer == 0))
        }
       
    
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if isEnabled {
                if timer > 0 {
                    timer -= 1
                } else {
                    stopTimer()
                }
            }
        })
}
    
    private func startTimer() {
        timer = (inputHours * 3600) + (inputMinutes * 60) + inputSeconds
        isEnabled = true
    }

    private func pauseTimer() {
        isEnabled.toggle()
    }

    private func resetTimer() {
        timer = 0
        isEnabled = false
    }

    private func stopTimer() {
        timer = 0
        isEnabled = false
    }
    
    private func resumeTimer() {
        isEnabled = true
        }
    
    private func formattedTime(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let remainingSeconds = seconds % 3600
        let minutes = remainingSeconds / 60
        let remainingSeconds2 = remainingSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds2)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
