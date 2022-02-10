//
// Created by Kefei Qian on 2022/2/10.
//

import WebKit
import SwiftUI

fileprivate class WebViewText: GNText {
    @Published var changeLanguageText: String!
    @Published var secondViewTitle: String!

    override init() {
        super.init()
        self.updateText()
    }

    override func updateText() {
        self.secondViewTitle = GNI18N.getLocalizedText(key: "second-view-title")
        self.changeLanguageText = GNI18N.getLocalizedText(key: "change-language-button")
    }
}

struct WebView : UIViewRepresentable {
    var html: String

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(html, baseURL:  nil)
    }

}

struct WebpageView: View {
    @ObservedObject fileprivate var text = WebViewText()

    var body: some View {
        WebView(html: "<html><body>hi</body></html>")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
    }
}
