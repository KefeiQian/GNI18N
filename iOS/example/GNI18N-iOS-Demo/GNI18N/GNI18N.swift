//
//  GNI18N.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/8.
//

import Foundation


public class GNI18N {
    private var options: GNI18NOptions
    public private(set) static var currentLang: GNI18NLang = GNConstants.DEFAULT_LANG


    init(options: GNI18NOptions) {
        self.options = options
    }

    public static func changeLanguage(lang: GNI18NLang) {
        currentLang = lang

        Bundle.setLanguage(lang)

        NotificationCenter.default.post(name: .GN_LANGUAGE_CHANGED, object: nil)
    }

    public static func getLocalizedText(key: String) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    }

    public static func getLocalizedText(key: String, table tableName: String? = nil) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: tableName)
    }

}
