//
//  BasketView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.trash) { iteam in
                    BasketDetailView(product: iteam)
                }
            }
            //MARK: добавить задний фон когда пустая корзина
                .listStyle(.plain)
                .environmentObject(viewModel)
            if !viewModel.trash.isEmpty {
                VStack {
                    Text("Итого")
                        .foregroundStyle(.gray)
                    Text("\(viewModel.totalPrrice().twoDigits()) ₽")
                    Button {
                        //прокупка
                    } label: {
                        Text("Оплатить")
                            .padding()
                            .padding(.horizontal,100)
                            .background(Color(hex: "15B742"))
                            .clipShape(Capsule())
                            .foregroundStyle(.white)
                    }
                }
                .padding()                
            }
        }
        .navigationTitle("Корзина")
    }
}

#Preview {
    NavigationStack {
        BasketView()
            .environmentObject(ViewModel())
    }
}




