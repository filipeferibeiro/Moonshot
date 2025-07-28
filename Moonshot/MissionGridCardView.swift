//
//  MissionGridCardView.swift
//  Moonshot
//
//  Created by Filipe Fernandes on 03/07/25.
//

import SwiftUI

struct MissionGridCardView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate(type: .small))
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                    .accessibilityElement()
                    .accessibilityLabel("Mission \(mission.displayName)")
                    .accessibilityHint("Mission date: \(mission.formattedLaunchDate(type: .small))")
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    MissionGridCardView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
