//
//  ContentView.swift
//  MyFirstSwiftUI
//
//  Created by Serhii Malyshko on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 5.0) {
            Text("Please fill in the form")
                .font(.title)
                .fontWeight(.bold)
            
            VStack {
                
                VStack(alignment: .leading) {
                    Text("First name")
                        .multilineTextAlignment(.leading)
                    
                    TextField("Enter your first name", text: .constant(""))
                }
                
                VStack(alignment: .leading) {
                    Text("Last name")
                        .multilineTextAlignment(.leading)
                    
                    TextField("Enter your last name", text: .constant(""))
                }
                
                DatePicker(selection: .constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date") })
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                    Text("Are you married?")
                }
                
                ColorPicker("Pick your favorite color", selection: .constant(.red))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Choose your gender")
                        
                        Picker(selection: .constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")) {
                            Text("Male").tag(1)
                            Text("Female").tag(2)
                            Text("Other").tag(3)
                        }
                    }
                    
                }
                
                Image("tick")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                HStack {
                    Link(destination: URL(string: "https://www.google.com")!) {
                        Text("Terms and Conditions")
                    }
                }
                
                
                Button("Submit") {
                    
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
