//
//  ContentView.swift
//  War Card Game
//
//  Created by Matt Sperry on 6/4/23.
//

import SwiftUI

struct ContentView: View {
    // @State shows that the variable powers the visual state
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State var resultText = ""
    
    var body: some View {
        
        ZStack{
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                Text(resultText)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal(){
        // Randomize the players card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        // Randomize the cpus card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        // Update the score
        if playerCardValue > cpuCardValue {
            //player wins
            playerScore += 1
            resultText = "Player wins round"
        } else if playerCardValue < cpuCardValue {
            //cpu wins
            cpuScore += 1
            resultText = "CPU wins round"
        } else {
            //tie
            resultText = "Tie, no score change"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
