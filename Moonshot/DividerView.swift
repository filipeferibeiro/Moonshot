//
//  DividerView.swift
//  Moonshot
//
//  Created by Filipe Fernandes on 03/07/25.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
