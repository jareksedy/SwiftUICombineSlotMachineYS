//
//  ContentView.swift
//  SwiftUICombineSlotMachineYS
//
//  Created by Ярослав on 19.02.2022.
//

import SwiftUI
import Combine

class SlotViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let emojiSourceArray = ["🍋", "🍒", "🦠"]
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        randomize()
        
        $running
            .receive(on: RunLoop.main)
            .map { $0 == true ? "Стоп!" : "Крутить!" }
            .assign(to: \.buttonText, on: self)
            .store(in: &cancellables)
    }
    
    func randomize() {
        slot1Emoji = emojiSourceArray[Int.random(in: 0...emojiSourceArray.count - 1)]
        slot2Emoji = emojiSourceArray[Int.random(in: 0...emojiSourceArray.count - 1)]
        slot3Emoji = emojiSourceArray[Int.random(in: 0...emojiSourceArray.count - 1)]
    }
    
    // input
    @Published var running = false
    
    // output
    @Published var slot1Emoji = ""
    @Published var slot2Emoji = ""
    @Published var slot3Emoji = ""
    
    @Published var buttonText = ""
}

struct ContentView: View {
    @ObservedObject private var slotViewModel = SlotViewModel()
    
    var body: some View {

        VStack {
            Spacer()
            
            Text("Крути эту хрень, чувак...")
            
            Spacer()
            
            HStack {
                Text(slotViewModel.slot1Emoji).font(.largeTitle)
                Spacer().frame(width: 25)
                Text(slotViewModel.slot2Emoji).font(.largeTitle)
                Spacer().frame(width: 25)
                Text(slotViewModel.slot3Emoji).font(.largeTitle)
            }

            Spacer()
            
            Button(action: { slotViewModel.running.toggle() }, label: { Text(slotViewModel.buttonText) })
            
            Spacer()
        }
    }
}
