//
//  ContentView.swift
//  ComponentsUI
//
//  Created by Denis Ostapiv on 03.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false
    
    var body: some View {
        
        VStack {
            Text("Заголовок проєкту")
                .font(.largeTitle)
                .bold(true)
        }
        .padding()
        
        VStack{
            Toggle(isOn: $isDarkMode) {
                Text("Темна тема")
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .padding()
        
        VStack{
            HStack{
                Label("Картинка яку додав з ассет каталогу", systemImage: "")
            }
            HStack{
                Image("panda")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .padding([.leading, .trailing], 16)
        
        VStack{
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
        }
        .padding([.leading, .trailing], 16)
        
        VStack{
            Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                Text("Оберіть кільксть")
            }
        }
        .padding([.leading, .trailing], 16)
        
        VStack{
            TextField("Ваш текст", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
        }
        .padding([.leading, .trailing], 16)
        
        VStack{
            Label("Іконка Планети", systemImage: "globe")
        }
        .padding()
        
        VStack {
            Button("Натисни кнопку") {
            }
        }
        .padding()
        
        VStack {
            DatePicker(selection: .constant(Date()), label: { Text("Оберіть дату") })
        }
        .padding([.leading, .trailing], 16)
        
        VStack{
            DisclosureGroup("Показати прихований текст") {
                Text("Прихований текст тільки")
            }
        }
        .padding([.leading, .trailing], 16)
        
        VStack {
            ColorPicker("Оберіть колір", selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
        }
        .padding([.leading, .trailing], 16)
    }
}

#Preview {
    ContentView()
}
