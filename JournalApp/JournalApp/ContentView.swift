//
//  ContentView.swift
//  JournalApp
//
//  Created by Mariapaula on 7/16/23.
//
//feelings page

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Image(systemName: "happy")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("this should be the feelings page")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
