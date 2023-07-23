//
//  ContentView.swift
//  JournalApp
//
//  Created by Mariapaula on 7/16/23.
//
//feelings page

import SwiftUI
import AVFoundation

struct FeelingsPicker: View {
    
    @State  var session: AVAudioSession?
    @State  var recorder: AVAudioRecorder?
    
    
    var body: some View {
        NavigationView{
           
            VStack(alignment: .center, spacing: 50, content:{
            
                Text("How are you feeling today?")
                .font(.title)
                .fontWeight(.bold)

                HStack{
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "happy", emotionColor: "happy-color")){
                            VStack{
                                Image("happy")
                                Text("happy")
                                    .foregroundColor(.black)
                            }
                        }

                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "calm", emotionColor: "calm-color")){
                            VStack{
                                Image("calm")
                                Text("calm")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "sad", emotionColor: "sad-color")){
                            VStack{
                                Image("sad")
                                Text("sad")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "angry", emotionColor: "angry-color")){
                            VStack{
                                Image("angry")
                                Text("angry")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "anxious", emotionColor: "anxious-color")){
                            VStack{
                                Image("anxious")
                                Text("anxious")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "loved", emotionColor: "loved-color")){
                            VStack{
                                Image("loved")
                                Text("loved")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "embarrassed", emotionColor: "embarrassed-color")){
                            VStack{
                                Image("embarrassed")
                                Text("embarrassed")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "bored", emotionColor: "bored-color")){
                            VStack{
                                Image("bored")
                                Text("bored")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: "jealous", emotionColor: "jealous-color")){
                            VStack{
                                Image("jealous")
                                Text("jealous")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                }
                
                NavigationLink(
                    destination: FeelingsSummaryView(emotionColor: .constant("white"), myEmotion: .constant("No Emotion Selected")),
                    label: {
                        Text("skip to journal")
                                    })
                
            }
        )
            
            .navigationBarItems(
                leading:
                    NavigationLink(
                    destination: ProfilePageView(),
                    label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                                    })
                    .padding(.leading, 20),
                trailing:
                NavigationLink(
                    destination: Text("CalenderView goes here"),
                    label: {
                        Image(systemName: "calendar")
                        .padding(.trailing, 20)
                        .foregroundColor(.black)
                                    })
                )
            
    
        }//end of NavigationView
        
    }//end of some View
    
}//end of View


struct EmotionRecorder: View{
    var body: some View{
        Text("Take a moment to record your feelings.")
    }
}

struct FeelingsPicker_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsPicker()
    }
}
