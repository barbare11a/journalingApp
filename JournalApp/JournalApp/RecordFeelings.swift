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
    @Binding var myEmotion: String
    @Binding var emotionColor: String
    @Binding var myUrl: URL?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dateHolder: DateHolder
    
    
    let audioRecorder = AudioRecorder()
    
    //View Constructor
    init(session: Binding<AVAudioSession?>, recorder: Binding<AVAudioRecorder?>, myEmotion: Binding<String>, emotionColor: Binding<String>, audioURL: Binding<URL?>) {
        
        _session = session
        _recorder = recorder
        _myUrl = audioURL
        _myEmotion = myEmotion
        _emotionColor = emotionColor
        
    }
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                    
              HStack{
                  NavigationLink(destination: ProfilePageView(myEmotion: $myEmotion, emotionColor: $emotionColor)) {
                        Image(systemName: "person.circle")
                            .padding()
                            .imageScale(.large)
                            .fontWeight(.light)
                            .padding(.leading)
                            .foregroundColor(.black)
                    }
                
                    
                    
                    Spacer()
                    
          
                    NavigationLink(destination: CalendarView(myEmotion: $myEmotion, emotionColor: $emotionColor).environmentObject(dateHolder)) {
                        Image(systemName: "calendar")
                            .padding()
                            .imageScale(.large)
                            .padding(.trailing)
                            .foregroundColor(.black)
                    }
                }
                    
                
                Text("Take a moment for your feelings").bold().font(.system(size: 30))
                    .padding(.bottom, 40)
                Text("Click on your emotion to record")
                
                    
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
                        
                        
                        if record {
                            Image("pause")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height: 220)
                                .clipShape(Circle())
                                .padding(.bottom, 110)
                        }else{
                            
                            Image(myEmotion)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height: 220)
                                .clipShape(Circle())
                                .padding(.bottom, 30)
                            
                        }
                    }//end zstack
                    
                }
                
                
                if started && !record {
                    // Show the "Resume" button only when the recording is paused
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
                            .padding(.bottom, 20)
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
                            
                            NavigationLink(destination: FeelingsSummaryView(emotionColor: $emotionColor, myEmotion: $myEmotion)) {
                                Text("Save Recording")
                                    .padding(.bottom, 30)
                                
                            }
                        }else{
                            NavigationLink(destination: FeelingsSummaryView(emotionColor: $emotionColor, myEmotion: $myEmotion)) {
                                Text("I want to write")
                                    .padding(.bottom, 30)
                            }
                        }
                    }
            }
                
        }
    }
}
    


struct record_feelings_Previews: PreviewProvider {
    
    static var previews: some View {
        @State  var session: AVAudioSession?
        @State  var recorder: AVAudioRecorder?
        @State var myString = "angry"
        @State var myUrl: URL? = URL(string: "https://www.example.com/mock_audio.wav") // Mock URL for preview
        let dateHolder = DateHolder()

        RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("angry"), emotionColor: .constant("angry-color"), audioURL: $myUrl)
            .environmentObject(dateHolder)
    }
}
