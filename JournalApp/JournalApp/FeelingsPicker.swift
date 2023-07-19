//
//  ContentView.swift
//  JournalApp
//
//  Created by Mariapaula on 7/16/23.
//
//feelings page

import SwiftUI

struct FeelingsPicker: View {

    var body: some View {
        
        VStack {
            HStack{
                
                Image("happy")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Text("this should be the feelings page")
                
            }
            
        }
        .padding()
    }
}

struct FeelingsPicker_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsPicker()
    }
}


