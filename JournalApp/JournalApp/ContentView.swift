//
//  ContentView.swift
//  JournalApp
//
//  Created by barbarella castillo on 7/10/23.
//

import SwiftUI
import AVFoundation
import DSWaveformImage
struct ContentView: View {
    @State private var isCustomViewActive = false
    @State var session : AVAudioSession! //instance for recording
    @State var recorder:AVAudioRecorder!
    
    
    @State var audioURL: URL?
    let audioRecorder = AudioRecorder()
    
    var body: some View {
        NavigationView {
            
            VStack {
                // Your content in ContentView
                Spacer()
                Button(action: {
                                isCustomViewActive = true
                            }) {
                                Text("Voice note")
                                    
                            }
                            .fullScreenCover(isPresented: $isCustomViewActive, content: {
                                RecordFeelings(session: $session, recorder: $recorder, myEmotion: "happy", audioURL: $audioURL)
                            })
                        
                       
                
                Spacer()
                //add player that matches UI design
                HStack{
                    Image(systemName: "play")
                    Button("Play", action: {
                        if audioURL != nil{
                        print("========")
                        print(audioURL!)
                            audioRecorder.playAudio(url: audioURL!)
                        print("========")
                        }
                        else{
                            print("No audio yet")
                            let pathURL = Bundle.main.url(forResource: "RickRoll", withExtension: "mp3")
                            if pathURL == nil{
                                print("SHIT IS ASS")
                            }else{
                                print("\(String(describing: pathURL))")
                                audioRecorder.playAudio(url: pathURL!)
                                
                            }
//                            audioRecorder.playAudio(url:pathURL )
                        }
                    })
                }
                
                Spacer()
                
            }
            .navigationTitle("Main View") .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
