//
//  FeelingsSummaryView.swift
//  JournalApp
//
//  Created by Nicole Potter on 7/12/23.
//

import SwiftUI

struct FeelingsSummaryView: View {
    
    @State var title:String = ""
    @State var journalEntry:String = ""
    @State var showProfilePage:Bool = false
    @Binding var emotionColor:String
    @Binding var myEmotion:String
    @EnvironmentObject var dateHolder: DateHolder
    
    
    var body: some View {
        
        let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM d, yyyy h:mm a"
                return formatter
            }()
        
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
                
                VStack{
                    
                    HStack{
                        TextField("Title",
                                  text: $title)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom)
                        
                    }.padding(.leading)
                    
                    HStack{
                        Image(systemName: "calendar")
                            .padding(.leading)
                        
                        Text(dateFormatter.string(from: dateHolder.date))
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        Spacer()
                        
                    }.padding(.leading)
                    
                    HStack{
                        Image(systemName: "pin")
                            .padding(.leading)
                        
                        Text(myEmotion)
                            .fontWeight(.bold)
                            .background(Rectangle().fill(Color(emotionColor)).shadow(radius: 2).frame(width: 60, height: 30))
                            .padding()
                        
                        
                        Spacer()
                    }.padding(.leading)
                    
                    HStack{
                        Image(systemName: "play")
                            .padding(.leading)
                        
                        Image(systemName: "waveform")
                            .padding(.leading)
                        
                        Text("1:13")
                        
                        Spacer()
                    }//end HStack
                    .padding(.leading)
                    
                    Divider()
                        .frame(width: 360)
                        .overlay(.black)
                    
                    HStack{
                        TextField("Start writing here...",
                                  text: $journalEntry)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.top)
                        
                    }.padding(.leading)
                    
                }
                
                
                //change Title placeholder value to darker gray
                //find a way to shift this VStack
                
                Spacer()
            }// end VStack
            .navigationBarHidden(true)
            
        }//end NavigationView
       
        
    }//end body
    
}//end FeelingsSummaryView

struct NavigationLinkDestination<Content: View>: View {
    let destination: Content
    
    var body: some View {
        destination
    }
    
    init(@ViewBuilder destination: () -> Content) {
        self.destination = destination()
    }
}




struct FeelingsSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dateHolder = DateHolder()
        
        FeelingsSummaryView(emotionColor: .constant("angry-color"), myEmotion: .constant("angry"))
            .environmentObject(dateHolder)
    }
}

