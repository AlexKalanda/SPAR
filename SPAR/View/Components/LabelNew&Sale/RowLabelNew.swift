//
//  ListLabelNew.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct RowLabelNew: View {
    var body: some View {
        Text("Новинки")
            .font(.caption)
            .foregroundStyle(.white)
            .padding(4)
            .background(Color(hex: "7A79BA"))
            .clipShape(.rect(cornerRadii: .init(topLeading: 6,
                                               bottomLeading: 0,
                                               bottomTrailing: 6,
                                               topTrailing: 6)))
    }
}
#Preview {
    RowLabelNew()
}
