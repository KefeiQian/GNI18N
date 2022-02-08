//
//  HomeView.swift
//  swift-ui-demo
//
//  Created by Kefei Qian on 2022/2/8.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Home").padding(50)
            
            Button("Change Language") {
                GNI18N.changeLanguage(lang: "en-us")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
