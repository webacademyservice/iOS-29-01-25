//
//  ContentView.swift
//  Block2
//
//  Created by Serhii Malyshko on 17.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                HStack(alignment: .top) {
                    HStack {
                        Text("17")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Finish Homework")
                        Text("Watch Block 6")
                        Text("Dating")
                        Text("Dating")
                    }.padding(.top, 0).padding(.leading, 10)
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("18")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Finish Homework")
                    }.padding(.top, 0).padding(.leading, 10)
                    
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("19")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Party!")
                    }.padding(.top, 0).padding(.leading, 10)
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("20")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Play Mind Game with my friends")
                    }.padding(.top, 0).padding(.leading, 10)
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("21")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Swift Online lesson")
                    }.padding(.top, 0).padding(.leading, 10)
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("22")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("House work")
                        Text("Buy products")
                        Text("Cook something")
                    }.padding(.top, 0).padding(.leading, 10)
                    
                }
                
                HStack(alignment: .top) {
                    HStack {
                        Text("23")
                    }.padding().border(Color.blue, width: 1)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Relax!")
                    }.padding(.top, 0).padding(.leading, 10)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
