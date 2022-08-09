//
//  ItemIDLookupView.swift
//  RunescapeApi
//
//  Created by Riley Calkins on 6/11/22.
//

import SwiftUI
import Shiny

struct ItemIDLookupView: View {
    let urlBaseString = "http://services.runescape.com/m=itemdb_oldschool"
    let itemInfoEndpoint = "/api/catalogue/detail.json?item="
    
    @State var itemId = "25354"
    @State var selectedItem:Item?
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    AsyncImage(url: URL(string: selectedItem?.icon_large ?? "")) { image in
                        image.resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                            .shiny(.rainbow)
                    }
                    RowView(item: selectedItem)
                }
                HStack {
                    TextField("Enter Item ID", text: $itemId, prompt: Text("Enter Item ID")).textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            getItemInfo(with: itemId) { item in
                                selectedItem = item
                            }
                        }
                    Button {
                        if itemId != "" {
                            getItemInfo(with: itemId) { item in
                                selectedItem = item
                            }
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing)
                            .shiny(.init(colors: [.blue, .purple, .black, .mint])) 
                    }
                }
            }.navigationTitle("Search ItemID")
                .shiny(.rainbow)
        }
    }
    
    func getItemInfo(with itemID: String, completion: @escaping (Item?) -> Void) {
        let urlString = urlBaseString + itemInfoEndpoint + itemID
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(nil)
                } else {
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    let jsonData = try! JSONDecoder().decode(Root.self, from: data)
                    selectedItem = jsonData.item
                }
            }.resume()
        }
    }
    
//    func getGraphData(with itemID: String, completion: @escaping ())
}

struct ItemIDLookupView_Previews: PreviewProvider {
    static var previews: some View {
        ItemIDLookupView()
    }
}
