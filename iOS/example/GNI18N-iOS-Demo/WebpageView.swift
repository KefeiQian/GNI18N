//
// Created by Kefei Qian on 2022/2/10.
//

import UIKit
import WebKit
import WKWebViewJavascriptBridge
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


struct WebpageView: View {
    @ObservedObject fileprivate var text = WebViewText()
    
    var body: some View {
        WebViewController()
    }
}

struct WebViewController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: _WebViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> _WebViewController {
        return _WebViewController()
    }
    
    class Coordinator: NSObject {
        var parent: WebViewController
        
        init(_ vc: WebViewController) {
            parent = vc
        }
    }
}

class _WebViewController: UIViewController {
    let webView = WKWebView(frame: CGRect(), configuration: WKWebViewConfiguration())
    var bridge: WKWebViewJavascriptBridge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = view.bounds
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        // setup bridge
        bridge = WKWebViewJavascriptBridge(webView: webView)
        bridge.isLogEnable = true
        bridge.register(handlerName: "testiOSCallback") { (paramters, callback) in
            print("testiOSCallback called: \(String(describing: paramters))")
            callback?("Response from testiOSCallback")
        }
        bridge.call(handlerName: "testJavascriptHandler", data: ["foo": "before ready"], callback: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        webView.load(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "dist")!)))
        webView.load(URLRequest(url: URL(string: "http://localhost:8080")!))
    }
}

extension _WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webViewDidStartLoad")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webViewDidFinishLoad")
    }
}

