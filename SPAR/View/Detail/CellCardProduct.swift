//
//  CellCardProduct.swift
//  SPAR
//
//  Created by admin on 31/8/2024.
//

import SwiftUI

struct CellCardProduct: View {
    var product: Product
    @EnvironmentObject var viewModel: ViewModel
    @State var isFavoritShow: Bool = false
    var body: some View {
        VStack(spacing:0) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 168,height: 168)
                .clipShape(.rect(cornerRadii: .init(topLeading: 16,
                                                    bottomLeading: 0,
                                                    bottomTrailing: 0,
                                                    topTrailing: 16)))
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        Image("star")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16,height: 16)
                        Text("\(product.rating.oneDigits())")
                    }
                    .padding(.horizontal, 8)
                }
                .overlay(alignment: .topLeading) {
                    if product.lableNew {
                        CellLabelNew()
                    } else if product.lableSale == true {
                        CellLabelSale()
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    if product.salePercent {
                        Text("𝟐𝟓%")
                            .foregroundStyle(Color(hex: "C32323"))
                            .padding(.trailing,8)
                    }
                }
                .overlay {
                    if product.trash {
                        ZStack {
                            Rectangle()
                                .opacity(0.7)
                                .clipShape(.rect(cornerRadii: .init(topLeading: 16,
                                                                    bottomLeading: 0,
                                                                    bottomTrailing: 0,
                                                                    topTrailing: 16)))
                            Text("\(product.count)")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .overlay(alignment: .topTrailing) {
                    if product.trash == false {
                        VStack(spacing: 20) {
                            Image("listOfGoods")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16,height: 16)
                            Image(product.like ? "loveGreen" : "love")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16,height: 16)
                                .onTapGesture {
                                    product.like.toggle()
                                    viewModel.product = product
                                    if viewModel.product.like {
                                        viewModel.addProductLikes(product)
                                    } else {
                                        viewModel.deleteProductLikes(product)
                                    }
                                }
                        }
                        .padding(8)
                        .background(.white)
                        .clipShape(Capsule())
                        .opacity(0.8)
                    }
                }
            
            
            VStack(alignment: .leading,spacing: 0) {
                Text(product.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Avenir", size: 14))
                    .foregroundStyle(Color(hex: "262626"))
                    .padding(.leading, 8)
                    .lineLimit(2,reservesSpace: true)
                Text(product.country)
                    .font(.custom("Avenir", size: 12))
                    .foregroundStyle(Color(hex: "262626"))
                    .padding(.leading, 8)
                HStack {
                    if product.trash == false {
                        VStack(alignment: .leading,spacing: 0) {
                            HStack {
                                HStack(spacing: 1) {
                                    Text("\(product.priceBig)")
                                        .font(.custom("Avenir", size: 12).bold())
                                        .padding(.leading, 8)
                                    VStack (alignment: .trailing){
                                        
                                        Text("\(product.priceSmal)")
                                            .font(.system(size: 10))
                                            .bold()
                                        
                                    }
                                }
                                
                                Image("rub")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            Text("\(product.oldPrice.twoDigits())")
                                .font(.system(size: 10))
                                .foregroundStyle(Color(hex: "262626"))
                                .strikethrough(true,color: Color(hex: "262626"))
                                .padding(.leading, 8)
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: product.trash ? .infinity : 60)
                            .frame(maxHeight: .infinity)
                            .foregroundStyle(Color(hex: "15B742"))
                            .clipShape(.rect(cornerRadius: 40))
                            .onTapGesture {
                                product.trash  = true
                                viewModel.addProductTrash(product)
                                viewModel.product = product
                            }
                            .overlay {
                                if product.trash {
                                    HStack{
                                        Image(systemName: "minus")
                                            .foregroundStyle(.white)
                                            .font(Font.system(size: 15).bold())
                                            .padding(4)
                                            
                                            .background(Color(hex: "15B742"))
                                            .clipShape(Circle())
                                            .onTapGesture {
                                                viewModel.product = product
                                                if viewModel.product.count == 1 {
                                                    viewModel.deleteProductTrash(product)
                                                    product.trash = false
                                                } else {
                                                    viewModel.product.count -= 1
                                                }
                                            }
                                        Spacer()
                                        VStack {
                                            Text("\(product.count) шт").bold()
                                            Text("~ \(product.totalPrice.twoDigits())")
                                                .font(.callout)
                                        }
                                        .foregroundStyle(.white)
                                        Spacer()
                                        Image(systemName: "plus")
                                            .foregroundStyle(.white)
                                            .font(Font.system(size: 15).bold())
                                            .padding(4)
                                            //.padding(.leading,20)
                                            .background(Color(hex: "15B742"))
                                            .clipShape(Circle())
                                            .onTapGesture {
                                                viewModel.product = product
                                                product.count += 1
                                            }
                                    }
                                }
                            }
                        if product.trash == false {
                            Image("trash")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 16,height: 16)
                        }
                    }
                    .padding(.trailing,8)
                    .padding(.bottom,4)
                }
            }
            .frame(width: 168)
            .background(.white)
            .animation(.easeInOut(duration: 0.1), value: product.trash)
        }
        .padding(.bottom,4)
        .frame(width: 168,height: 278)
        .background(.white)
        .clipShape(.rect(cornerRadii: .init(topLeading: 16,
                                            bottomLeading: 20,
                                            bottomTrailing: 20,
                                            topTrailing: 16)))
        .shadow(color: Color(hex: "8B8B8B"),radius: 8).opacity(0.9)
        .environmentObject(viewModel)
    }
}

#Preview {
    CellCardProduct(product: .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, price: 100.40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: true))
        .environmentObject(ViewModel())
}
