//
// Created by Kefei Qian on 2022/2/10.
//

import SwiftUI


fileprivate class SecondViewText: GNText {
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

struct SecondView: View {
    @ObservedObject fileprivate var text = SecondViewText()

    var body: some View {
        VStack(alignment: .center) {
            Text(text.secondViewTitle).padding(20)

            Button(text.changeLanguageText) {
                GNI18N.changeLanguage(lang: getRandomLangExceptCurrentLang())
            }
                    .padding(20)
        }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
    }
}