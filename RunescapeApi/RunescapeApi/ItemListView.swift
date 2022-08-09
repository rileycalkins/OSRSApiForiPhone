//
//  ItemListView.swift
//  RunescapeApi
//
//  Created by Riley Calkins on 6/11/22.
//

import SwiftUI

struct ItemListView: View {
    
    let urlBaseString = "http://services.runescape.com/m=itemdb_oldschool"
    let itemsStartingWithEndpoint = "/api/catalogue/items.json?category=1&alpha=y&page=z"
    @State var collectionOfData: [Item]?
    @State var startingLetter = "A"
    @State var pageNumber = "1"
    @State var total = 0
    @State var numberOfPages = 0
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Text("Enter the First Letter of an item you want")
                    TextField("Enter First Letter of items you want", text: $startingLetter, prompt: Text("Enter starting Letter"))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    HStack {
                        TextField("Enter Page Number", text: $pageNumber, prompt: Text("Enter page number"))
                            .textFieldStyle(.roundedBorder)
                        Text("of \(numberOfPages) pages")
                            .foregroundColor(.black)
                    }.padding()
                   
                    Button {
                        getItemsStartingWith(with: startingLetter, onPage: Int(pageNumber) ?? 0) { items in
                            collectionOfData = items
                        }
                    } label: {
                        Text("Fetch Items (\(total))")
                    }
                    
                    
                }
                ScrollView {
                    VStack {
                        ForEach(collectionOfData ?? []) { item in
                            NavigationLink {
                                ItemDetailView(item: item)
                            } label: {
                                RowView(item: item)
                                
                            }.listStyle(.plain)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                        }
                    }.listStyle(.plain)
                }
            }.navigationTitle("OSRS Item List")
        }
    }
    
    func getItemsStartingWith(with letter: String, onPage: Int, completion: @escaping ([Item]?) -> Void) {
        let endpoint = itemsStartingWithEndpoint.replacingOccurrences(of: "&alpha=y", with: "&alpha=\(letter)".lowercased())
        let finalEndpont = endpoint.replacingOccurrences(of: "&page=z", with: "&page=\(onPage)".lowercased())
        let urlString = urlBaseString + finalEndpont
        print(urlString)
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
                    let jsonData = try! JSONDecoder().decode(ItemsRoot.self, from: data)
                    collectionOfData = jsonData.items
                    total = jsonData.total
                    numberOfPages = total / 12
                }
            }.resume()
        }
    }
    
    
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
