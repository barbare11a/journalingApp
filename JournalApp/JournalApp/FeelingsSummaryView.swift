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
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                HStack{
                    
                    NavigationLink(destination: ProfilePageView()) {
                        Image(systemName: "person.circle")
                            .padding()
                            .imageScale(.large)
                            .fontWeight(.light)
                            .padding(.leading)
                            .foregroundColor(.black)
                    }
                    
                    
                
                
                Spacer()
                    
                    NavigationLink(destination: CalendarView()){
                        
                        Image(systemName: "calendar")
                            .padding()
                            .imageScale(.large)
                            .padding(.trailing)
                            .foregroundColor(.black)
                        
                        
                    }
                    .environmentObject(DateHolder())
            
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
                        
                        Text("June 6, 2023 12:45 PM")
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        Spacer()
                        
                    }.padding(.leading)
                    
                    HStack{
                        Image(systemName: "pin")
                            .padding(.leading)
                        
                        Text("Embarassed")
                            .fontWeight(.bold)
                            .background(Rectangle().fill(Color.purple).shadow(radius: 2))
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





struct FeelingsSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsSummaryView()
    }
}

