//
//  ProfileTopEmotionPicker.swift
//  JournalApp
//
//  Created by Nicole Potter on 7/15/23.
//

import SwiftUI

struct ProfileTopEmotionPicker: View {
    
    @Binding var isShowingEmotionPicker:Bool
    @Binding var topEmotion1: Image?
    @Binding var topEmotion2: Image?
    @Binding var topEmotion3: Image?
    @State private var selectedEmotions: [Image] = []
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
       
        VStack{
            
            Spacer()
            
            Text("Choose an Emotion")
                .fontWeight(.bold)
                .font(.system(size: 25))
            
            Spacer()
            
            HStack(){
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("happy"),
                                        isSelected: isSelected(image: Image("happy")), selectedEmotions: $selectedEmotions, imageName: "Happy",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("calm"),
                                        isSelected: isSelected(image: Image("calm")), selectedEmotions: $selectedEmotions, imageName: "Calm",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("sad"),
                                        isSelected: isSelected(image: Image("sad")), selectedEmotions: $selectedEmotions, imageName: "Sad",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack(){
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("angry"),
                                        isSelected: isSelected(image: Image("angry")), selectedEmotions: $selectedEmotions, imageName: "Angry",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("anxious"),
                                        isSelected: isSelected(image: Image("anxious")), selectedEmotions: $selectedEmotions, imageName: "Anxious",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("loved"),
                                        isSelected: isSelected(image: Image("loved")), selectedEmotions: $selectedEmotions, imageName: "Loved",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack(){
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("embarrassed"),
                                        isSelected: isSelected(image: Image("embarrassed")), selectedEmotions: $selectedEmotions, imageName: "Embarassed",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("bored"),
                                        isSelected: isSelected(image: Image("bored")), selectedEmotions: $selectedEmotions, imageName: "Bored",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
                
                VStack{
                    EmotionSelectionView(
                                        image: Image("jealous"),
                                        isSelected: isSelected(image: Image("jealous")), selectedEmotions: $selectedEmotions, imageName: "Jealous",
                                        topEmotion1: $topEmotion1,
                                        topEmotion2: $topEmotion2,
                                        topEmotion3: $topEmotion3
                                    )
                }
                
                Spacer()
            }
            
            
            Spacer()
        
            Text("Back to profile editor")
                .padding(.bottom)
                .foregroundColor(.blue)
                .onTapGesture{
                    saveSelectedEmotions()
                    isShowingEmotionPicker = false
                }
            
        }
        
        
    }
    func isSelected(image: Image) -> Bool {
            return selectedEmotions.contains(image)
        }
    
     func toggleSelection(image: Image) {
            if isSelected(image: image) {
                selectedEmotions.removeAll { $0 == image }
            } else {
                selectedEmotions.append(image)
            }
        }
        
    func saveSelectedEmotions() {
            if selectedEmotions.count >= 3 {
                topEmotion1 = selectedEmotions[0]
                topEmotion2 = selectedEmotions[1]
                topEmotion3 = selectedEmotions[2]
            }
        }
    
    
}




struct EmotionSelectionView: View {
    let image: Image
    let isSelected: Bool
    @Binding var selectedEmotions: [Image]
    let imageName:String
    @Binding var topEmotion1: Image?
    @Binding var topEmotion2: Image?
    @Binding var topEmotion3: Image?
    
    var body: some View {
        VStack {
            Button(action: {
                toggleSelection()
            }) {
                image
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: isSelected ? 4 : 0)
                    )
            }
            .onTapGesture {
                toggleSelection()
                // Update the selected emotions in ProfileTopEmotionPicker
                selectedEmotions = [topEmotion1, topEmotion2, topEmotion3].compactMap { $0 }
            }
            
            Text("\(imageName)")
                .fontWeight(.semibold)
        }
        
    }
        
    func toggleSelection() {
            if isSelected {
                selectedEmotions.removeAll { $0 == image }
            } else {
                if selectedEmotions.count < 3 {
                    selectedEmotions.append(image)
                }
            }
        }
    }
    
    

struct ProfileTopEmotionPicker_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTopEmotionPicker(isShowingEmotionPicker: .constant(false), topEmotion1: .constant(nil), topEmotion2: .constant(nil), topEmotion3: .constant(nil))
    }
}
