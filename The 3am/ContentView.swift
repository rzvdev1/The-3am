//
//  ContentView.swift
//  The 3am
//
//  Created by Julio Ramirez on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isRunning = false
    @State private var timer: Timer? = nil
    @State private var secondsElapsed = 0
    @State private var distanceRun = 0.0 // Distance run in miles

    let speed = 6.0 // Speed in miles per hour

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("LETS GO!")
            Text("Seconds: \(secondsElapsed)")
            Text("Distance: \(distanceRun, specifier: "%.2f") miles") // Display distance run
            
            HStack {
                Button(action: {
                    startRun()
                }) {
                    Text("Start Run")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    finishRun()
                }) {
                    Text("Finish Run")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
    
    func startRun() {
        print("Run started")
        isRunning = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
            self.distanceRun += self.speed / 3600 // Calculate distance run
        }
    }

    func finishRun() {
        print("Run finished")
        isRunning = false
        self.timer?.invalidate()
        self.timer = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
