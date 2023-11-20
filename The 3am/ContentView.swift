//
//  ContentView.swift
//  The 3am
//
//  Created by Julio Ramirez on 11/15/23.
//

import SwiftUI
import URLImage

struct ContentView: View {
    @State private var isRunning = false
    @State private var timer: Timer? = nil
    @State private var secondsElapsed = 0
    @State private var distanceRun = 0.0

    let speed = 6.0
    //use Image Address
    let url: URL = URL(string: "https://images.unsplash.com/photo-1544764200-d834fd210a23?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!

    var body: some View {
        VStack {
            URLImage(url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("LETS GO!")
            Text("Seconds: \(secondsElapsed)")
            Text("Distance: \(distanceRun, specifier: "%.2f") miles")
            
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
        .preferredColorScheme(.dark)
    }
    
    func startRun() {
        print("Run started")
        isRunning = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
            self.distanceRun += self.speed / 3600
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

