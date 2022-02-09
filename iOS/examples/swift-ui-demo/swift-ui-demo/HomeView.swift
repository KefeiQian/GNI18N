//
//  HomeView.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/8.
//

import SwiftUI

class LocalizedText: GNText {
    @Published var helloTitle:String!
    @Published var nameText:String!
    
    override init() {
        super.init()
        self.updateText()
    }
    
    override func updateText() {
        self.helloTitle = GNI18N.getLocalizedText(key: "hello-title")
        self.nameText = GNI18N.getLocalizedText(key: "name %@", table: nil, arguments: name)
    }
}

let name = "KQ"

struct HomeView: View {
    @ObservedObject var text = LocalizedText()
    
    var body: some View {
        VStack{
            Text(text.helloTitle).padding(20)
            
            Text(text.nameText).padding(20)
            
            Button("Change Language") {
                let cnZH = GNI18NLang(langName: "zh-Hans")
                GNI18N.changeLanguage(lang: cnZH)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.locale, .init(identifier: "en"))
        
        HomeView().environment(\.locale, .init(identifier: "zh-Hans"))
        
        HomeView().environment(\.locale, .init(identifier: "ja-JP"))
    }
}
