//
//  BottomBannerAd.swift
//  BrainMath
//
//  Created by G Zhen on 8/19/23.
//

import SwiftUI

struct BottomBannerAd: View {
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(CustomColor.tintColor, lineWidth: 1)
                .frame(width: 320, height: 50)
            Text("Ad placement")
        }
    }
}

struct BottomBannerAd_Previews: PreviewProvider {
    static var previews: some View {
        BottomBannerAd()
    }
}
