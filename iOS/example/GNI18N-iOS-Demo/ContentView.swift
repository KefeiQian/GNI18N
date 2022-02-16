//
//  ContentView.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/8.
//

import SwiftUI

private class ContentViewText: GNText {
  @Published var homeTitle: String!
  @Published var profileTitle: String!
  @Published var webpageTitle: String!

  override init() {
    super.init()
    self.updateText()
  }

  override func updateText() {
    self.homeTitle = GNI18N.shared.getLocalizedText(key: "home-tab-title")
    self.profileTitle = GNI18N.shared.getLocalizedText(key: "profile-tab-title")
    self.webpageTitle = GNI18N.shared.getLocalizedText(key: "webpage-tab-title")
  }
}

struct ContentView: View {
  @ObservedObject fileprivate var text = ContentViewText()

  var body: some View {
    NavigationView {
      TabView {
        HomeView()
          .tabItem {
            Image(systemName: "house.fill")
            Text(text.homeTitle)
          }
          .tag(0)

        WebpageView()
          .tabItem {
            Image(systemName: "network")
            Text(text.webpageTitle)
          }.tag(1)

        ProfileView()
          .tabItem {
            Image(systemName: "person.crop.circle")
            Text(text.profileTitle)
          }
          .tag(2)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
