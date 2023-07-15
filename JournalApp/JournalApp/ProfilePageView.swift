//
//  ProfilePageView.swift
//  JournalApp
//
//  Created by Nicole Potter on 7/14/23.
//

import SwiftUI
import UIKit

struct ProfilePageView: View {
    
    @State var userName:String = "Nicole"
    @State var firstName:String = "Nicole"
    @State var lastName:String = "Cruz"
    @State var email:String = "nicolerocks@gmail.com"
    @State var profileImage: UIImage? = nil
    @State var isShowingEditProfile: Bool = false
    @State var topEmotion1: Image? = nil
    @State var topEmotion2: Image? = nil
    @State var topEmotion3: Image? = nil
    


    
    var body: some View {
        
            VStack{
                HStack{
                    
                    Spacer()
                    
                    Image(systemName: "calendar")
                        .padding()
                        .imageScale(.large)
                    
                }//end HStack
                .padding(.trailing)
                
                HStack{
                    Text("Hello \(userName)!")
                        .padding(.leading)
                        .font(.system(size: 25))
                    
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .bold()
                        .foregroundColor(.blue)
                    
                  
                   Text("Edit Profile")
                       .padding(.trailing)
                       .foregroundColor(.blue)
                       .onTapGesture{
                           isShowingEditProfile = true
                       }
                       .sheet(isPresented: $isShowingEditProfile) {
                           EditProfileView(profileImage: $profileImage, isShowingEditProfile: $isShowingEditProfile, topEmotion1: $topEmotion1, topEmotion2: $topEmotion2, topEmotion3: $topEmotion3) {
                               // Closure to handle image update
                               updatedImage in
                               profileImage = updatedImage
                           }
                       }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                
            ProfileView(profileImage: profileImage)
                
                
                Text("my top three emotions:")
                    .fontWeight(.semibold)
                
                
                HStack{
                    
                    
                    emotionsView(topEmotion1: topEmotion1, topEmotion2: topEmotion2, topEmotion3: topEmotion3)
                   

                    
                }
                .padding(.top)
                .padding(.bottom)
                
                
                VStack{
                    
                    HStack{
                        Text("First name:")
                            .padding(.leading)
                        
                        Spacer()
                        
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Text(firstName)
                        .font(.system(size: 25))
                        .background(Rectangle().fill(Color("input-background-color")).frame(width: 300, height: 50).cornerRadius(20))
                    
                    HStack{
                        Text("Last name:")
                            .padding(.leading)
                            .padding(.top)
                        
                        Spacer()
                        
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Text(lastName)
                        .font(.system(size: 25))
                        .background(Rectangle().fill(Color("input-background-color")).frame(width: 300, height: 50).cornerRadius(20))
                    
                    HStack{
                        Text("Email:")
                            .padding(.leading)
                            .padding(.top)
                        
                        Spacer()
                        
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    HStack{
                        
                        Text(email)
                            .font(.system(size: 25))
                            .background(Rectangle().fill(Color("input-background-color")).frame(width: 300, height: 50).cornerRadius(20))
                            .padding(.bottom)
                        
                    }
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    
                }
                
                
                
                Spacer()
                
            }//end VStack
            
        }//end body
        
    
}//end ProfilePageView

struct ProfileView: View {
    var profileImage: UIImage?

    var body: some View {
        
        VStack{
            
            if let profileImage = profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 200, height: 150)
            } else {
                Image(systemName: "person.circle")
                    .font(.system(size: 165).weight(.ultraLight))
            }
        }
    }
}

struct emotionsView: View {
    var topEmotion1: Image?
    var topEmotion2: Image?
    var topEmotion3: Image?

    var body: some View {
        
        VStack{
            
            if let topEmotion1 = topEmotion1, let topEmotion2 = topEmotion2, let topEmotion3 = topEmotion3 {
                HStack{
                    
                    Spacer()
                    
                    topEmotion1
                    
                    Spacer()
                    
                    topEmotion2
                    Spacer()
                    
                    topEmotion3

                    Spacer()
                    
                }
                .padding(.bottom)
            } else {
                HStack{
                    
                    Spacer()
                    
                    Image("plus.circle")
                    
                    Spacer()
                    
                    Image("plus.circle")
                    
                    Spacer()
                    
                    Image("plus.circle")
                    
                    Spacer()
                    
                }
                .padding(.bottom)
            }
        }
    }
}


struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
     
            ProfilePageView()
    }
}



