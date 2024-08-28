//
//  CatalogView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct CatalogView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var screenStatus: Bool = false
    var body: some View {
        NavigationStack {
            List(viewModel.products, id: \.id) { iteam in
                RowCartProduct(product: iteam)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        screenStatus.toggle()
                    }
                } label: {
                    switch screenStatus {
                    case true: ButtonListStatus()
                    case false: ButtonTileStatus()
                    }
                }
                .padding(.bottom,8)
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    NavigationStack {
        CatalogView()
            .environmentObject(ViewModel())
    }
}

struct RowCartProduct: View {
    var product: Product
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var selected = "Шт"
    @State private var tapButton = false
    @State private var isFavoritShow: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        ZStack(alignment: .topLeading) {
                            Image(product.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 144,height: 144)
                            if tapButton {
                                ZStack {
                                    Rectangle()
                                        .background(.black).opacity(0.4)
                                        .clipShape(.rect(cornerRadius: 16))
                                    Text(product.count.description)
                                        .foregroundStyle(.white).opacity(0.8)
                                        .font(.system(size: 50))
                                }
                                
                            }
                            if product.lableNew {
                                RowLabelNew()
                            } else if product.lableSale {
                                RowLabelSale()
                            }
                        }
                        if product.salePercent {
                            Text("𝟐𝟓 %")
                                .foregroundStyle(Color(hex: "C32323"))
                        }
                    }
                }
                
                
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack {
                            Image("star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16,height: 16)
                            //этот и лбой другой текст обрубает нижнюю полоску, почему?
                            Text(product.rating.description)
                                .font(.system(size: 12))
                            Divider()
                            Text("\(product.reviewCount) отзывов")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        .frame(height: 20)
                        Text(product.title)
                            .font(.system(size: 14))
                    }
                    if tapButton == false {
                        Text(product.country)
                            .font(.system(size: 12))
                        Spacer()
                    } else {
                        Spacer()
                        Picker("", selection: $selected) {
                            ForEach(PickerType.allCases, id: \.rawValue) { meas in
                                Text(meas.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(height: 28)
                        
                    }
                    
                    HStack {
                        
                        if tapButton == false {
                            VStack (alignment: .leading,spacing: 0) {
                                HStack(alignment: .top,spacing: 2) {
                                    Text(product.priceBig.description)
                                        .font(.system(size: 20)).bold()
                                    Text(product.priceSmal.description)
                                        .font(.system(size: 16)).bold()
                                    Image("rub")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                }
                                Text(product.oldPrice.description)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.black.opacity(0.6))
                                    .strikethrough(true,color: .gray)
                            }
                            Spacer()
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: tapButton ? 200 : 48)
                                .foregroundStyle(Color(hex: "15B742"))
                                .clipShape(.rect(cornerRadius: 40))
                                .onTapGesture {
                                    tapButton = true
                                    viewModel.addProductTrash(product)
                                    viewModel.product = product
                                }
                            if !tapButton {
                                Image("trash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16,height: 16)
                            } else {
                                HStack {
                                    Image(systemName: "minus")
                                        .bold()
                                        .padding()
                                        .background(Color(hex: "15B742"))
                                        .clipShape(Circle())
                                        .onTapGesture {
                                            viewModel.product = product
                                            if viewModel.product.count == 1 {
                                                viewModel.deleteProductTrash(product)
                                                tapButton = false
                                            } else {
                                                viewModel.product.count -= 1
                                            }
                                        }
                                    Divider()
                                    Spacer()
                                    VStack {
                                        Text("\(product.count) \(selected).")
                                            .font(.system(size: 16).bold())
                                        Text("~ \(Int(product.totalPrice).description)")
                                            .font(.system(size: 12).italic())
                                    }
                                    
                                    Spacer()
                                    Divider()
                                    Image(systemName: "plus")
                                        .bold()
                                        .padding(.horizontal)
                                        .background(Color(hex: "15B742"))
                                        .clipShape(Circle())
                                        .onTapGesture {
                                            viewModel.product = product
                                            product.count += 1
                                        }
                                }
                                .foregroundStyle(.white)
                            }
                        }
                    }
                    .frame(height: 36)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            .overlay(alignment: .topTrailing) {
                VStack {
                    Image("listOfGoods")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16,height: 16)
                        .padding(.horizontal,4)
                        .padding(.bottom,8)
                    Image(isFavoritShow ? "loveGreen" : "love")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16,height: 16)
                        .padding(.horizontal,4)
                        .padding(.top,8)
                        .onTapGesture {
                            isFavoritShow.toggle()
                        }
                }
            }
            .frame(height: 144)
        }
        Divider()
            .environmentObject(viewModel)
    }
    
}

