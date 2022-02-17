//
//  GNConstants.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/9.
//

import Foundation

struct GNConstants {
  static let DEFAULT_LANG = GNI18NLang(
    langName: Locale.autoupdatingCurrent.languageCode ?? Locale.current.languageCode ?? "en")

  static let LANG_KEY = "lang"
  static let BRIDGE_KEY = "bridge"

  static let CHANGE_LANGUAGE_NATIVE_BRIDGE_NAME = "changeLanguageNative"
  static let CHANGE_LANGUAGE_WEB_BRIDGE_NAME = "changeLanguageWeb"
  static let GET_NATIVE_LANG_BRIDGE_NAME = "getNativeLanguage"
}
