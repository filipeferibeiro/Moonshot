//
//  MissionListCardView.swift
//  Moonshot
//
//  Created by Filipe Fernandes on 03/07/25.
//

import SwiftUI

struct MissionListCardView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    HStack(spacing: 0) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate(type: .small))
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
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
    
    ScrollView {
        MissionListCardView(missions: missions, astronauts: astronauts)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}
