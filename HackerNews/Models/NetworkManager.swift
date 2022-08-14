//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Danylo Kushlianskyi on 14.08.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        guard let URL = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        else {return}
        
        let session = URLSession.shared.dataTask(with: URL) { data, response, error in
            if error == nil{
                let decoder = JSONDecoder()
                if let safeData = data{
                    do {
                        var results = try decoder.decode(Results.self, from: safeData)
                        print(results)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch  {
                        print(error)
                    }
                }
            }
        }
        session.resume()
    }
}
