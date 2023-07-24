//
//  EditProfileView.swift
//  JournalApp
//
//  Created by Nicole Potter on 7/15/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var userName:String = "Nicole"
    @State var firstName:String = "Nicole"
    @State var lastName:String = "Cruz"
    @State var email:String = "Test@test.com"
    @Binding var profileImage: UIImage?
    @Binding var isShowingEditProfile: Bool
    @State private var showingImagePicker = false
    @Binding var topEmotion1: Image?
    @Binding var topEmotion2: Image?
    @Binding var topEmotion3: Image?
    var onImageUpdate: (UIImage?) -> Void
    @State var isShowingEmotionPicker:Bool = false

    var body: some View {
        
        VStack{
            
            HStack{
                
                
                Spacer()
                
                //button leading to editProfilePageView
                Text("Save")
                    .padding(.trailing)
                    .foregroundColor(.blue)
                    .onTapGesture{
                        isShowingEditProfile = false
                    }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 70)
            
            HStack{
                
                HStack{
                    
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 165)
                            .clipShape(Circle())
                            .frame(width: 200, height: 150)
                            .onTapGesture {
                                showingImagePicker = true
                            }
                    } else {
                        Image(systemName: "person.circle")
                            .font(.system(size: 165).weight(.ultraLight))
                            .onTapGesture {
                                showingImagePicker = true
                            }
                            .sheet(isPresented: $showingImagePicker) {
                                ImagePicker(image: $profileImage)
                            }
                        
                        
                    }
                }
                
            
            }
            
            Text("Remove Profile Picture")
                .foregroundColor(.blue)
                .onTapGesture{
                    profileImage = nil
                }
            
            Text("edit my top three emotions:")
                .foregroundColor(.blue)
                .padding(.top)
                .onTapGesture{
                    isShowingEmotionPicker = true
                }
                .sheet(isPresented: $isShowingEmotionPicker) {
                    ProfileTopEmotionPicker(isShowingEmotionPicker: $isShowingEmotionPicker, topEmotion1: $topEmotion1, topEmotion2: $topEmotion2, topEmotion3: $topEmotion3)
                    }
            
            
            HStack{
                
                /*Spacer()
                
                Image("happy")
                
                Spacer()
                
                Image("calm")
                
                Spacer()
                
                Image("sad")
                
                Spacer()*/
                
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
                        .padding(.bottom)
                    
                }
                .padding(.bottom)
                
            }
            
            
            
            Spacer()
            
        }//end VStack
        .onDisappear {
            // Call the onImageUpdate closure when the view disappears (e.g., when Save is tapped)
            onImageUpdate(profileImage)
            
        }//end body
        
        
    }//end EditProfileView
    
    struct ImagePicker: UIViewControllerRepresentable {
        @Environment(\.presentationMode) var presentationMode
        @Binding var image: UIImage?
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            @Binding var presentationMode: PresentationMode
            @Binding var image: UIImage?
            
            init(presentationMode: Binding<PresentationMode>, image: Binding<UIImage?>) {
                _presentationMode = presentationMode
                _image = image
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let selectedImage = info[.originalImage] as? UIImage {
                    image = selectedImage
                }
                
                presentationMode.dismiss()
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                presentationMode.dismiss()
            }
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(presentationMode: presentationMode, image: $image)
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = context.coordinator
            return imagePicker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            // No need to update the view controller
        }
    }
    
    struct EditProfileView_Previews: PreviewProvider {
        
        static var previews: some View {
            EditProfileView(profileImage: .constant(nil), isShowingEditProfile: .constant(false), topEmotion1: .constant(nil), topEmotion2: .constant(nil), topEmotion3: .constant(nil)){ _ in
                
            }
        }
    }
}
