//
//  ContentView.swift
//  Moonshot
//
//  Created by Filipe Fernandes on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var displayAsList = false
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if displayAsList {
                    MissionListCardView(missions: missions, astronauts: astronauts)
                } else {
                    MissionGridCardView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Display Type", systemImage: displayAsList ? "square.grid.2x2" : "rectangle.grid.1x2.fill") {
                    displayAsList.toggle()
                }
                .foregroundStyle(.white)
            }
            .tint(.white)
        }
    }
}

#Preview {
    ContentView()
}
