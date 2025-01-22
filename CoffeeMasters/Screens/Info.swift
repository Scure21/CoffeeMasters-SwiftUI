//
//  InfoView.swift
//  CoffeeMasters
//
//  Created by Stephanie Cure on 1/22/25.
//

import SwiftUI
import WebKit

class WebInterfaceDialogs: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
          let config = WKWebViewConfiguration()
          config.userContentController.add(WebInterfaceDialogs() , name: "alert")
          return WKWebView(frame: .zero, configuration: config) // -> UIKit View
      }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
            let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")!
            webView.load(URLRequest(url: url))
            
            let name = UserDefaults.standard.string(forKey: "name") ?? ""
            webView.evaluateJavaScript("injectFormData('\(name)')")
        }
    
}

struct Info: View {
    var body: some View {
        VStack{
            WebView()
        }
       
    }
}

#Preview {
    Info()
}
