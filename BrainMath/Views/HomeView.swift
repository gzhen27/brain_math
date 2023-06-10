//
//  HomeView.swift
//  BrainMath
//
//  Created by G Zhen on 6/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TrainView()
                .background(CustomColor.backgroundColor)
            .tabItem {
                Label("Train", systemImage: "graduationcap.circle")
                    .environment(\.symbolVariants, .none)
            }
            QuestView()
            .background(CustomColor.backgroundColor)
            .tabItem {
                Label("Quest", systemImage: "trophy.circle")
                    .environment(\.symbolVariants, .none)
            }
            SettingView()
            .background(CustomColor.backgroundColor)
            .tabItem {
                Label("Setting", systemImage: "gearshape.2")
                    .environment(\.symbolVariants, .none)
            }
        }
        .onAppear {
            customizeTabViewStyle()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
