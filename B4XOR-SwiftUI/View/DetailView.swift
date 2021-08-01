//
//  DetailedView.swift
//  B4XOR-SwiftUI
//
//  Created by Apple on 18/06/21.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url:String?
    
    var body: some View {

        WebView(urlString: url)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}

struct WebView : UIViewRepresentable {
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
              let request =  URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
}
