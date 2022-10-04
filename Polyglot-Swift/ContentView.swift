//
//  ContentView.swift
//  Polyglot-Swift
//
//  Created by Tyler Kruer on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    private var selectedKeyboard: UIKeyboardType = .default
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your name", text: $name)
                    .foregroundColor(.black)
                    .keyboardType(selectedKeyboard)
                    .padding()
                Text("Hey \(name)! " + String(cString: sayhello()))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

