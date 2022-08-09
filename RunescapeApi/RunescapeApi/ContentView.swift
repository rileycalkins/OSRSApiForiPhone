//
//  ContentView.swift
//  RunescapeApi
//
//  Created by Riley Calkins on 6/10/22.
//

import SwiftUI
import Shiny

struct RowView: View {
    let item: Item?
    var body: some View {
        HStack {
            AsyncImage(url:URL(string: item?.icon ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .shiny(.rainbow)
                
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item?.name ?? "Placeholder items name").bold()
                        .foregroundColor(.black)
                    Spacer()
                    if let item = item {
                        Text(String(describing: item.id)).bold()
                            .foregroundColor(.black)
                    }
                }
                
                Text(item?.description ?? "Placeholder items description")
                    .foregroundColor(.black)
            }
        }.padding()
        .frame(alignment: .leading)
    }
}

struct ContentView: View {
    var body: some View {
//        TabView{
//            ItemIDLookupView()
//                .tag("ItemID")
//                .tabItem {
//                    HStack {
//                        Image(systemName: "pyramid")
//                        Text("ItemID")
//                    }
//                }
            ItemListView()
                .tag("ItemList")
                .tabItem {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("ItemList")
                    }
                }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
