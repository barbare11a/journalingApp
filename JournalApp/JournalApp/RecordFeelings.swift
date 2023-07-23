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
    @State var myEmotion: String
    @State var emotionColor: String
    
    //View Constructor
    init(session: Binding<AVAudioSession?>, recorder: Binding<AVAudioRecorder?>, myEmotion: String, emotionColor: String) {
        
        _session = session
        _recorder = recorder
        self.myEmotion = myEmotion
        self.emotionColor = emotionColor
    }
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Text("Take a moment for your feelings").bold().font(.system(size: 30))
                    .padding(.top)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                Text("Click on your emotion to record")
                    .padding(.top)
                Spacer()
                Button(action:{
                    record.toggle()
                }){
                    ZStack{
                        
                        VStack{


                        if record {
                            
                            Spacer()
                            Image("pause")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height: 220)
                                .clipShape(Circle())
                                .padding(.bottom)                      .padding(.bottom)
                            
                            Spacer()
                            NavigationLink(
                                destination: FeelingsSummaryView(emotionColor: $emotionColor, myEmotion: $myEmotion),
                                label: {
                                    Text("Save Recording")
                                })
                                .foregroundColor(.blue)
                                .padding(.bottom)
                                .padding(.bottom)
                                .contentShape(Rectangle())
                        }else{
                            Spacer()
                            Image(myEmotion)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height: 220)
                                .clipShape(Circle())
                                .padding(.bottom)                            .padding(.bottom)
                            
                            Spacer()
                            NavigationLink(
                                destination: FeelingsSummaryView(emotionColor: $emotionColor, myEmotion: $myEmotion),
                                label: {
                                    Text("I want to write")
                                })
                            .foregroundColor(.blue)
                            .padding(.bottom)
                            .padding(.bottom)
                            .contentShape(Rectangle())
                            
                        }
                        }
                    }
                }
                Spacer()
                
                
              
            }
        }
    }
}

struct record_feelings_Previews: PreviewProvider {
    
    static var previews: some View {
        @State  var session: AVAudioSession?
        @State  var recorder: AVAudioRecorder?
        @State var myString = "angry"
        
        RecordFeelings(session: $session, recorder: $recorder, myEmotion: myString, emotionColor: "angry-color")
    }
}
