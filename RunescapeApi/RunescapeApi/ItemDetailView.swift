//
//  ItemDetailView.swift
//  RunescapeApi
//
//  Created by Riley Calkins on 6/11/22.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: item.icon_large)) { image in
                image.resizable()
                    .frame(width: 200, height: 200, alignment: .center)
            } placeholder: {
                Image(systemName: "photo").resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.gray.opacity(0.3))
            }
            HStack {
                VStack(alignment: .leading){
                    Text(item.name)
                        .foregroundColor(.black)
                    Text(item.description)
                        .foregroundColor(.black)
                }
                VStack {
                    Text(String(describing: item.id))
                    Text("Item type: " + item.type)
//                    AsyncImage(url: URL(string: item.icon_large)) { image in
//                        image.resizable()
//                            .frame(width: 50, height: 50, alignment: .center)
//                    } placeholder: {
//                        Image(systemName: "photo").resizable()
//                            .frame(width: 50, height: 50, alignment: .center)
//                            .foregroundColor(.gray.opacity(0.3))
//                    }
                }
            }
        }
    }
}

//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(item: Item(current: Current(price: "2.2m", trend: "neutral"),
//                                  day180: Trend(change: "+10.0%", trend: "positive"),
//                                  day30: Trend(change: "-4.0%", trend: "negative"),
//                                  day90: Trend(change: "-16.0%", trend: "negative"),
//                                  description: "A weapon from the Abyss.",
//                                  icon: "https://secure.runescape.com/m=itemdb_oldschool/1654684188257_obj_sprite.gif?id=4151",
//                                  icon_large: "https://secure.runescape.com/m=itemdb_oldschool/1654684188257_obj_big.gif?id=4151",
//                                  id: 4151,
//                                  members: "true",
//                                  name: "Abyssal whip",
//                                  today: Current(price: "+21.0k", trend: "positive"),
//                                  type: "Default",
//                                  typeIcon: "https://www.runescape.com/img/categories/Default"))
//    }
//}
