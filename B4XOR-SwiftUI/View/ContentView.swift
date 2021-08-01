//
//  ContentView.swift
//  B4XOR-SwiftUI
//
//  Created by Apple on 17/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.result){ post in
                NavigationLink(
                    destination: DetailView(url : post.url) ,
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                )
            }
            .navigationBarTitle("H4XOR")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts:[Post] = [

//    Post(id: "1", title: "Hello"),
//    Post(id: "1", title: "hola"),
//    Post(id: "1", title: "namastae"),
//]



//yoo

