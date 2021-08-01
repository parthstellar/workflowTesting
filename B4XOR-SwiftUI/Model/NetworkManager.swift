//
//  NetworkManager.swift
//  B4XOR-SwiftUI
//
//  Created by Apple on 17/06/21.
//

import Foundation

class NetworkManager : ObservableObject {
    
    @Published var result = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if let e = error {
                    print("task error \(e)")
                }
                else{
                    if let safeData = data{
                        let decoder = JSONDecoder()
                        do{
                            let decodedData = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.result = decodedData.hits
                            }
                        }
                        catch {
                            print("error in decoding: \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
