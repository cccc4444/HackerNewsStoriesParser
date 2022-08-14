//
//  ContentView.swift
//  HackerNews
//
//  Created by Danylo Kushlianskyi on 14.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts, rowContent: { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            })
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13 Pro").previewInterfaceOrientation(.portrait)
    }
}


