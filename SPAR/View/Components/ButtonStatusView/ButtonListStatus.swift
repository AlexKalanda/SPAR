//
//  ButtonListStatus.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct ButtonListStatus: View {
    var body: some View {
        Image("list")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 18,height: 18)
            .padding(13)
            .background(Color(hex: "F1F1F1"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ButtonListStatus()
}
