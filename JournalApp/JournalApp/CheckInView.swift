//
//  ContentView.swift
//  JournalApp
//
//  Created by Mariapaula on 7/16/23.
//
//checkin page

import SwiftUI

struct CheckInView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        NavigationStack{
          
            ZStack{
                Image("homepage")
                    .padding(.top,230)
                
                         NavigationLink(
                            destination: FeelingsPicker(myEmotion: "", emotionColor: ""),
                    label: {
                        Text("Let's get started →")
                          
                })
                .font(.headline)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(.horizontal,60)
                .padding(.vertical,25)
                .offset(x: 0, y: 200)
                .background(
                    Color.blue
                        .cornerRadius(40)
                        .shadow(radius:10)
                        .offset(x: 0, y: 200)
                        )
                .padding(.top, 100)
          
                VStack(alignment: .leading, content:{
                    
                    Text("Welcome, Mia")
                        .font(.title3)
                        .padding(.top,50)
                        .padding(.leading, 40)
                        .padding(.bottom, 50)
                    
                    
                    
                    Text("Get started with your daily check-in")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 40)
                        .padding(.trailing, 100)
                    Spacer()
                })
                
            
                
            }
    
            
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: CalendarView(myEmotion:.constant(""), emotionColor: .constant("")).environmentObject(dateHolder), //this is a placeholder
                        label: {
                            Image(systemName: "calendar")
                                .padding(.trailing, 20)
                                .foregroundColor(.black)
                        }))
            
            
            
            
        }
        
    }//end of NavigationView
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dateHolder = DateHolder()
        
        CheckInView()
            .environmentObject(dateHolder)

    }
}
