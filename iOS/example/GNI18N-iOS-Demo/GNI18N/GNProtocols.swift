//
//  GNProtocols.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/9.
//

import Foundation


public struct GNI18NLang: Hashable {
    let name: String

    init(langName: String) {
        self.name = langName
    }
}

public struct GNI18NOptions {
    var lang = GNConstants.DEFAULT_LANG

}
