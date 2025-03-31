//
//  ModalView.swift
//  XBike
//
//  Created by Rafael Martins on 31/03/25.
//

import SwiftUI

struct TimerModalView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var timerRunning = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var formattedTime: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: timeElapsed) ?? "00:00:00"
    }

    var body: some View {
        if isPresented {
            VStack(spacing: 20) {

                Text(formattedTime)
                    .font(.system(size: 50, weight: .bold, design: .monospaced))

                HStack {
                    Button(timerRunning ? "Pause" : "Start") {
                        timerRunning.toggle()
                    }
                    .padding()
                    .background(timerRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Stop") {
                        timeElapsed = 0
                        timerRunning = false
                        isPresented = false
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .frame(width: 330, height: 200)
            .padding()
            .background(Color.gray.opacity(0.9))
            .cornerRadius(20)
            .shadow(radius: 10)
            .onReceive(timer) { _ in
                if timerRunning {
                    timeElapsed += 1
                }
            }
            .animation(.easeInOut)
        }
    }
}
