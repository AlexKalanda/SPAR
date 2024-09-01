//
//  CellLabelSale.swift
//  SPAR
//
//  Created by admin on 31/8/2024.
//

import SwiftUI

struct CellLabelSale: View {
    var body: some View {
        Text("Удар по ценам")
            .font(.caption)
            .foregroundStyle(.white)
            .padding(4)
            .background(Color(hex: "FC6A6F"))
            .clipShape(.rect(cornerRadii: .init(topLeading: 16,
                                               bottomLeading: 0,
                                               bottomTrailing: 6,
                                               topTrailing: 6)))
    }
}

#Preview {
    CellLabelSale()
}
