//
//  ContentView.swift
//  MacTubes
//
//  Created by Kevin Dion on 2022-10-18.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let webView = WebView()
    
    var body: some View {
        webView
            .toolbar {
                Spacer()
                
                Text("MacTubes")
                    .padding(.leading, 110)
                
                Spacer()
                
                Button(action: {
                    self.webView.wkWebView.goBack()
                }, label: {
                    Image(systemName: "chevron.left")
                })
                
                Button(action: {
                    self.webView.wkWebView.goForward()
                }, label: {
                    Image(systemName: "chevron.right")
                })
                
                Button(action: {
                    self.webView.wkWebView.reload()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
            }
            .background(colorScheme == .dark
                ? Color(red: 0.13, green: 0.13, blue: 0.13)
                : Color(red: 1.00, green: 1.00, blue: 1.00)
            )
    }
}

struct WebView: NSViewRepresentable {
    let wkWebView = WKWebView()
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = wkWebView
        
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15"
        
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let url = URL(string: "https://www.youtube.com")
        let urlRequest = URLRequest(url: url!)
        
        nsView.load(urlRequest)
    }
}
