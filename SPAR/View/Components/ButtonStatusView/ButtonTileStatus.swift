//
//  ButtonTileStatus.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct ButtonTileStatus: View {
    var body: some View {
        Image("tile")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 18,height: 18)
            .padding(13)
            .background(Color(hex: "F1F1F1"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ButtonTileStatus()
}
