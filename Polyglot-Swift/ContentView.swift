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
    @State private var showingAlert: Bool = false
    private var alertTitle: String = "Check your terminal 😃"
    private var alertButtonText: String = "Sweet!"
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("C++ Functions")) {
                    TextField("Enter your name", text: $name)
                        .foregroundColor(.black)
                        .keyboardType(selectedKeyboard)
                        .padding()
                    Text("Hey \(name)! " + String(cString: sayhellocpp()))
                }
                Section(header: Text("C Functions")) {
                    Button(action: {
                        showingAlert = true
                        sayhelloc()
                    }, label: {
                        Text("Run Some C Code")
                    }).alert(Text(alertTitle),
                             isPresented: $showingAlert,
                             actions: {
                                 Button(alertButtonText) { }
                        }
                    )
                }
                Section(header: Text("Obj-C Functions")) {
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
