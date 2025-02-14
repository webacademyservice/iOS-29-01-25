//
//  ContentView.swift
//  Block2
//
//  Created by Oleksandr Hryhoruk on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Just text")
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
            }
            .padding()
            .frame(width: 120, height: 40)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            Image("boat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
        }
      
        .padding()
        .background(Color.gray)
       Spacer()
        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Дата") })
        Spacer()
        
        HStack {
            Image("light")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Push this button")
            Button("Nothing") {
            }
            .padding()
            .frame(width: 120, height: 40)
            .foregroundColor(.yellow)
            .background(Color.red)
            .cornerRadius(10)
            
        }
      
        .padding()
        .background(Color.gray.opacity(0.2))
    }

}

#Preview {
    ContentView()
}
