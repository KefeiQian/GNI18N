//
//  GNI18N.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/8.
//

import Foundation


public class GNI18N {
    private static let sharedGNI18NInstance = GNI18N(options: GNI18NOptions())
    
    private var options: GNI18NOptions
    
    public private(set) var currentLang: GNI18NLang
    
    private var appBundle: Bundle
    
    init(options: GNI18NOptions) {
        self.options = options
        self.currentLang = GNConstants.DEFAULT_LANG
        self.appBundle = Bundle.main
    }
    
    static func changeLanguage(lang: GNI18NLang) {
        guard let langPath = Bundle.main.path(forResource: lang.name, ofType: "lproj") else {
            shared().appBundle = Bundle.main
            return
        }
        
        shared().appBundle = Bundle(path: langPath)!
        
        shared().currentLang = lang
        NotificationCenter.default.post(name: .GN_LANGUAGE_CHANGED, object: nil)
    }
    
    public static func getLocalizedText(key: String, table tableName: String? = nil, arguments: CVarArg...) -> String {
        return String.localizedStringWithFormat(shared().appBundle.localizedString(forKey: key, value: nil, table: tableName), arguments)
    }
    
    static func shared() -> GNI18N {
        return sharedGNI18NInstance;
    }
}
