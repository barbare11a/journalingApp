//
//  ContentView.swift
//  JournalApp
//
//  Created by barbarella castillo on 7/10/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isCustomViewActive = false
    @State var session : AVAudioSession! //instance for recording
    @State var recorder:AVAudioRecorder!
    
    var body: some View {
        NavigationView {
            VStack {
                // Your content in ContentView
                
                NavigationLink(destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "happy"), isActive: $isCustomViewActive) {
                    Text("Go to Custom View")
                }
                .foregroundColor(.blue)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .onTapGesture {
                    isCustomViewActive = true
                }
            }
            .navigationTitle("Main View")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
