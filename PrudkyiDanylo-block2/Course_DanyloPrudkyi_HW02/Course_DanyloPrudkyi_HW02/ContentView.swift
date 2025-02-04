//
//  ContentView.swift
//  Course_DanyloPrudkyi_HW02
//
//  Created by Danylo Prudkyi on 01.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("TitleText")
                    .font(.largeTitle)
                    .padding()
            }
            VStack {
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            .padding()
            
            ZStack {
                Image(systemName: "Circle")
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                Text("Hello")
                
            }
            
            Spacer()
            
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            .padding()
            
            Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
            }
            
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            
            
            Button("Button") {
                
            }
            .font(.headline)
            
            
            Spacer()
            
            RenameButton()
                .font(.headline)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("BGCustom")
                .ignoresSafeArea()
                .blur(radius: 6))
        
}
}


#Preview {
    ContentView()
}
