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
    @Binding var session : AVAudioSession! //instance for recording
    @Binding var recorder:AVAudioRecorder!
    let myEmotion: String
        
        //View Constructor
        init(session: Binding<AVAudioSession?>, recorder: Binding<AVAudioRecorder?>, myEmotion: String) {
            
            _session = session
            _recorder = recorder
            self.myEmotion = myEmotion
        }
    
    
    var body: some View {
        
        
        VStack{
            
            Text("Take a moment for your feelings").bold().font(.system(size: 30))
            Text("Click on your emotion to record")
            Spacer()
            Button(action:{
                record.toggle()
            }){
                ZStack{
                   
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
                }
            }
            Spacer()
            Button {
                print("Button pressed")
            } label: {
                Text("I want to write")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
    }
}


struct record_feelings_Previews: PreviewProvider {
    
    static var previews: some View {
        @State  var session: AVAudioSession?
        @State  var recorder: AVAudioRecorder?
        @State var myString = "angry"
        
        RecordFeelings(session: $session, recorder: $recorder, myEmotion: myString)
    }
}


