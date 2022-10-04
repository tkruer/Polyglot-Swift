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
    @State private var showingAlertC: Bool = false
    @State private var showingAlertOBJC: Bool = false
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
                        showingAlertC = true
                        sayhelloc()
                    }, label: {
                        Text("Run Some C Code")
                    }).alert(Text(alertTitle),
                             isPresented: $showingAlertC,
                             actions: {
                                 Button(alertButtonText) { }
                        }
                    )
                }
                Section(header: Text("Obj-C Functions")) {
                    Button(action: {
                        //MARK: Come back to this one, can't seem to get the function to link
                        #warning("TODO: Link function")
                        showingAlertOBJC = true
                    }, label: {
                        Text("Run Some Obj-C Code")
                    }).alert(Text(alertTitle),
                             isPresented: $showingAlertOBJC,
                             actions: {
                                 Button(alertButtonText) { }
                        }
                    )
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
