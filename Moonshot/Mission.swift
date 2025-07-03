//
//  Mission.swift
//  Moonshot
//
//  Created by Filipe Fernandes on 03/07/25.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    enum FormatType {
        case small, full
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    func formattedLaunchDate(type: FormatType) -> String {
        var formatType: Date.FormatStyle.DateStyle
        
        switch type {
        case .small:
            formatType = .abbreviated
        case .full:
            formatType = .complete
        }
        
        return launchDate?.formatted(date: formatType, time: .omitted) ?? "N/A"
    }
}
