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
    @State var session : AVAudioSession! //instance for recording
    @State var recorder:AVAudioRecorder!
    var body: some View {
        
        
        VStack{
            Rectangle().frame(height: 40).foregroundColor(.blue) // Upper menu stuff
            
            Text("Take a moment for your feelings").bold().font(.system(size: 30))
            Text("Click on your emotion to record")
            Spacer()
            Button(action:{
                record.toggle()
            }){
                ZStack{
                    if record {
                        Circle().fill(Color(hex: "#6911F9")).frame(width: 220, height: 220).opacity(0.4)
                        
                    }
                   
                    Circle().fill(Color(hex: "#6911F9")).frame(width: 190, height: 190)
                    
                    
                }
            }
            Spacer()
            Button {
                print("Button pressed")
            } label: {
                Text("I want to write")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
    }
}


struct record_feelings_Previews: PreviewProvider {
    static var previews: some View {
        RecordFeelings()
    }
}

extension Color {
    init(hex: String) {
        var hexValue: UInt64 = 0
        let scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        
        scanner.scanHexInt64(&hexValue)

        let red = Double((hexValue & 0xFF0000) >> 16) / 255.0
        let green = Double((hexValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(hexValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
