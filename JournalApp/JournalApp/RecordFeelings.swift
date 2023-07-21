//
//  record_feelings.swift
//  JournalApp
//
//  Created by Johnny on 7/12/23.
//

import SwiftUI
import AVFoundation


struct RecordFeelings: View {
    
    @State var record = false
    @State var started = false
    
    @Binding var session : AVAudioSession! //instance for recording
    @Binding var recorder:AVAudioRecorder!
    @Binding var myUrl: URL?
    @Environment(\.presentationMode) var presentationMode
    
    
    
    let myEmotion: String
    let audioRecorder = AudioRecorder()
    
        //View Constructor
    init(session: Binding<AVAudioSession?>, recorder: Binding<AVAudioRecorder?>, myEmotion: String, audioURL: Binding<URL?>) {
            
            _session = session
            _recorder = recorder
            self.myEmotion = myEmotion
            _myUrl = audioURL
            
        }
    
    
    
    
    var body: some View {
        
        
        VStack{
            Spacer()
            
            Text("Take a moment for your feelings").bold().font(.system(size: 30))
            Text("Click on your emotion to record")
            Spacer()
            Spacer()
            Button(action:{
                record.toggle()
                started = true
                
                if record{
                    audioRecorder.startRecording()
                }else{
                    audioRecorder.pauseRecording()
                }
                
                
                
            }){
                ZStack{// recording button
                   
                    Image(myEmotion)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 220)
                        .clipShape(Circle())
                    
                    if record {
                        Image("pause")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 220, height: 220)
                            .clipShape(Circle())
                        
                    }
                }//end zstack
                
                            }
            Spacer()
            if started && !record{
                Button {
                    print("Button pressed")
                    audioRecorder.resumeRecording()
                    record.toggle()
                } label: {
                    Text("Resume")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            
            
            Spacer()
            
            Button {
                print("Button pressed")
                //Save recording
                if started{
                    if (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("recording.WAV")) != nil {
                        myUrl = audioRecorder.saveRecording()
                                }
                    print("RECORDFEELINGS VIEW \(String(describing: myUrl))")
                
                    presentationMode.wrappedValue.dismiss()//go back to previous screen
                    
                }else{ //Go back to notes
                    presentationMode.wrappedValue.dismiss()//go back to previous screen
                }
                
            } label: {
                if started{
                    Text("Save Recording")
                        .padding(20)
                }else{
                Text("I want to write")
                    .padding(20)}
            }
            .contentShape(Rectangle())
        }.padding(1)
    }
    
    
}
