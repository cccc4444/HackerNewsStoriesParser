//
//  PotData.swift
//  HackerNews
//
//  Created by Danylo Kushlianskyi on 14.08.2022.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id : String {return objectID}
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
