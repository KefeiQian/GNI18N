//
// Created by Kefei Qian on 2022/2/10.
//

import SwiftUI

private class NextPageViewText: GNText {
  @Published var changeLanguageText: String!
  @Published var nextPageViewTitle: String!

  override init() {
    super.init()
    self.updateText()
  }

  override func updateText() {
    self.nextPageViewTitle = GNI18N.getLocalizedText(key: "second-view-title")
    self.changeLanguageText = GNI18N.getLocalizedText(key: "change-language-button")
  }
}

struct NextPageView: View {
  @ObservedObject fileprivate var text = NextPageViewText()

  var body: some View {
    VStack(alignment: .center) {
      Text(text.nextPageViewTitle).padding(20)

      Button(text.changeLanguageText) {
        GNI18N.shared.changeLanguage(lang: getRandomLangExceptCurrentLang())
      }
      .padding(20)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .edgesIgnoringSafeArea(.all)
  }
}
