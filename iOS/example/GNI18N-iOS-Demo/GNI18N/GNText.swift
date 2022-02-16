//
//  GNText.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/9.
//

import SwiftUI

class GNText: ObservableObject {
  init() {
    NotificationCenter.default.addObserver(
      self, selector: #selector(updateText), name: .GN_LANGUAGE_CHANGED, object: nil)
  }

  @objc func updateText() {
  }
}
