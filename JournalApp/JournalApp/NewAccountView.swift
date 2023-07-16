//
//  NewAccountView.swift
//  JournalApp
//
//  Created by barbarella castillo on 7/14/23.
//

import SwiftUI
import FirebaseAuth

struct NewAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isCreateAccountViewPresented = false
    @State private var isPasswordCorrect: Bool = false
    @State private var showErrorAlert: Bool = false

    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Image("svg-image")
                    
                
                VStack{
                    Spacer()
                    
                    //Spacer()
                    HStack{
                     
                        Text("Welcome to Chattie,")
                            .font(.system(size: 20))
                            .padding(.bottom)
                            .padding(.bottom)
                            .padding(.bottom)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                        Spacer()
                            
                    }
                 
                   
                    HStack{
                        Spacer()
                        Text("sign in")
                            .font(.system(size: 20))
                            .padding(.trailing)
                        Text("sign up")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .underline()
                        Spacer()
                       
                    }//end of Hstack
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)// VStack{
                        
                    HStack{
                       
                        Image(systemName: "person.fill")
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)

                         
                        
                        TextField("email", text: $email)
                            .font(.system(size: 20))
                           
                            
                        
                         
                        if(email.count != 0){
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                //.frame(width: 30)
                                
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                
                            
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                            
                                            

                        
                    }.background(Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 315, height: 61)
                        .background(Color(red: 0.16, green: 0.5, blue: 0.9).opacity(0.2))
                        .cornerRadius(90))
                    .padding(.leading)
                    .padding(.leading)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.trailing)
                    .padding(.trailing)
                    
                    
                    
                
                        
                        HStack{
                            Image(systemName: "lock.fill")
                                .padding(.leading)
                                .padding(.leading)
                                .padding(.leading)
                                .padding(.leading)
                                .padding(.leading)
                                .padding(.leading)
                                .padding(.leading)
                            TextField("password", text: $password)
                                .font(.system(size: 20))
                               
                                .background(Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 309, height: 61)
                                    .background(Color(red: 0.16, green: 0.5, blue: 0.9).opacity(0.2))
                                    .cornerRadius(90))
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                .padding(.trailing)
                                

                            
                        }//end hstack
                    
                    HStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                       
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                        }
                        .padding(.top)
                        .padding(.top)
                        Spacer()
                        Spacer()
                        
                        
                        /*
                        Button(action: {
                            isCreateAccountViewPresented.toggle()
                        }){Image(systemName: "arrow.right.circle.fill")
                                
                        }.font(.system(size: 40))
                            .foregroundColor(.blue)
                            .padding(.top)
                            .padding(.top)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.trailing)
                            .padding(.trailing)
                        
        
                            .sheet(isPresented: $isCreateAccountViewPresented){
                                ContentView()
                            }
                        
                        //THIS SHOULD NOT TAKE TO LOGIN APP IT SHOULD DIRECT TO HOMEPAGE/CHECKIN
                        */
                        
                        //Spacer()
                        
                        //------------------------------------------------------
                        Button(action: {
                            Auth.auth().createUser(withEmail: email, password: password){
                                authResult, error in
                                if let error = error{
                                    print(error)
                                    
                                    return
                                }
                                if let authResult = authResult{
                                    print("\(authResult.user.uid)")
                                }
                            }
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 40))
                                    .foregroundColor(.blue)
                                    .padding(.top)
                                    .padding(.top)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.trailing)
                                    .padding(.trailing)
                        }
                        
                       // Spacer()
                        
                
                          
                        Spacer()
                       
                    }//hstack
                    //}
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                }//end of vstack
                
                
                
            }//end of zstack
        }//end of navstack
    }//end of body
}//end of loginview

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
