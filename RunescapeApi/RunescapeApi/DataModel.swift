//
//  DataModel.swift
//  RunescapeApi
//
//  Created by Riley Calkins on 6/11/22.
//

import Foundation

struct Root: Decodable{
    let item: Item
}

struct ItemsRoot:Decodable {
    let items:[Item]
    let total: Int
}

struct Item: Identifiable, Decodable {
//    let current: Current
//    let day180: Trend?
//    let day30: Trend?
//    let day90: Trend?
    let description: String
    let icon: String
    let icon_large: String
    let id: Int
    let members: String
    let name: String
//    let today: Current
    let type: String
    let typeIcon: String
}

//struct Current {
//    let price: String?
//    let intPrice: Int?
//    let trend: String
//    enum CodingKeys: String, CodingKey {
//        case price
//        case intPrice
//        case trend
//    }
//}
//
//extension Current: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print(values)
//    }
//}

//
//extension Current {
//    
//}

//
//struct Trend: Decodable {
//    let change: String
//    let trend: String
//}
//
//struct ResponseObject: Decodable, Identifiable {
//    let current: Current
//    let day180: Trend
//    let day30: Trend
//    let day90: Trend
//    let description: String
//    let icon: String
//
//
//}
