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
    @State var audioURL: URL?
    @EnvironmentObject var dateHolder: DateHolder
    @State var myEmotion:String
    @State var emotionColor:String
    
    
    var body: some View {
        
        NavigationView{
           
            VStack(alignment: .center, spacing: 50, content:{
            
                Text("How are you feeling today?")
                .font(.title)
                .fontWeight(.bold)

                HStack{
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("happy"), emotionColor: .constant("happy-color"), audioURL: $audioURL)){
                            VStack{
                                Image("happy")
                                Text("happy")
                                    .foregroundColor(.black)
                            }
                        }
                

                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("calm"), emotionColor: .constant("calm-color"), audioURL: $audioURL)){
                            VStack{
                                Image("calm")
                                Text("calm")
                                    .foregroundColor(.black)

                            }
                        }
                  
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("sad"), emotionColor: .constant("sad-color"), audioURL: $audioURL)){
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
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("angry"), emotionColor: .constant("angry-color"), audioURL: $audioURL)){
                            VStack{
                                Image("angry")
                                Text("angry")
                                    .foregroundColor(.black)

                            }
                        }
          
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("anxious"), emotionColor: .constant("anxious-color"), audioURL: $audioURL)){
                            VStack{
                                Image("anxious")
                                Text("anxious")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("loved"), emotionColor: .constant("loved-color"), audioURL: $audioURL)){
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
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("embarrassed"), emotionColor: .constant("embarrassed-color"), audioURL: $audioURL)){
                            VStack{
                                Image("embarrassed")
                                Text("embarrassed")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("bored"), emotionColor: .constant("bored-color"), audioURL: $audioURL)){
                            VStack{
                                Image("bored")
                                Text("bored")
                                    .foregroundColor(.black)

                            }
                        }
                    Spacer()
                    NavigationLink(
                        destination: RecordFeelings(session: $session, recorder: $recorder, myEmotion: .constant("jealous"), emotionColor: .constant("jealous-color"), audioURL: $audioURL)){
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
                    destination: ProfilePageView(myEmotion: $myEmotion, emotionColor: $emotionColor).environmentObject(dateHolder),
                    label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                                    })
                    .padding(.leading, 20),
                trailing:
                NavigationLink(
                    destination: CalendarView(myEmotion: $myEmotion, emotionColor: $emotionColor).environmentObject(dateHolder),
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
        
        let dateHolder = DateHolder()

        
        FeelingsPicker(myEmotion: "calm", emotionColor: "calm-color")
            .environmentObject(dateHolder)
    }
}
