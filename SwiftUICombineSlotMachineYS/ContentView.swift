//
//  ContentView.swift
//  SwiftUICombineSlotMachineYS
//
//  Created by Ярослав on 19.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack {
            Spacer()
            
            Text("Крути эту хрень, чувак...")
            
            Spacer()
            
            HStack {
                Text("🍋").font(.largeTitle)
                Spacer().frame(width: 25)
                Text("🍒").font(.largeTitle)
                Spacer().frame(width: 25)
                Text("🌞").font(.largeTitle)
            }

            Spacer()
            
            Button(action: {}, label: { Text("Крутить") })
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.preferredColorScheme(.dark)
    }
}
