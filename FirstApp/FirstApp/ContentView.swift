//
//  ContentView.swift
//  FirstApp
//
//  Created by Nikush on 01.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Привіт!")
            DisclosureGroup(/*@START_MENU_TOKEN@*/"Group"/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
            EditButton()
            Gauge(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*/0...1/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            LabeledContent(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
            Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Link")/*@END_MENU_TOKEN@*/
            }

        }
        .padding(.all)
    }
}
#Preview {
    ContentView()
}
